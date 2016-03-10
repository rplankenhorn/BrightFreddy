//
//  ServiceUtil.swift
//  FSwift
//
//  Created by Kelton Person on 11/15/14.
//  Copyright (c) 2014 Kelton. All rights reserved.
//

import Foundation

public enum ArrayEncodingStrategy {
    case PHP
    case MultiParam
}

public enum RequestMethod : String {
    case POST = "POST"
    case GET = "GET"
    case DELETE = "DELETE"
    case PUT = "PUT"
    case OPTIONS = "OPTIONS"
    case CONNECT = "CONNECT"
    case TRACE = "TRACE"
    case HEAD = "HEAD"
    case PATCH = "PATCH"
}

public extension String {
    
    func withParams(params: Dictionary<String, AnyObject>, arrayEncodingStrategy: ArrayEncodingStrategy = ArrayEncodingStrategy.MultiParam) -> String {
        let endpoint = self.hasPrefix("?") ? self :  self + "?"
        return  endpoint + (NSString(data: ServiceUtil.asParams(params, arrayEncodingStrategy: arrayEncodingStrategy), encoding: NSUTF8StringEncoding)! as String)
    }
    
}

public class ServiceUtil {
    
    public class func asJson(obj: AnyObject, jsonWriteOptions: NSJSONWritingOptions = NSJSONWritingOptions()) -> NSData? {
        do  {
            return try NSJSONSerialization.dataWithJSONObject(obj, options: jsonWriteOptions)
        }
        catch {
            return nil
        }
    }
    
    public class func asParamsStr(params: Dictionary<String, AnyObject>, arrayEncodingStrategy: ArrayEncodingStrategy = ArrayEncodingStrategy.MultiParam) -> String {
        var pairs:[String] = []
        for (key, value) in params {
            if let v = value as? Dictionary<String, AnyObject> {
                for (subKey, subValue) in v {
                    let escapedFormat = CFURLCreateStringByAddingPercentEscapes(nil, subValue.description, nil, "!*'();:@&=+$,/?%#[]", CFStringBuiltInEncodings.UTF8.rawValue)
                    pairs.append("\(key)[\(subKey)]=\(escapedFormat)")
                }
            } else if let v = value as? [AnyObject] {
                for subValue in v {
                    let escapedFormat = CFURLCreateStringByAddingPercentEscapes(nil, subValue.description, nil, "!*'();:@&=+$,/?%#[]", CFStringBuiltInEncodings.UTF8.rawValue)
                    if arrayEncodingStrategy == ArrayEncodingStrategy.MultiParam {
                        pairs.append( "\(key)=\(escapedFormat)")
                    } else {
                        pairs.append("\(key)[]=\(escapedFormat)")
                    }
                }
            } else {
                let escapedFormat = CFURLCreateStringByAddingPercentEscapes(nil, value.description, nil, "!*'();:@&=+$,/?%#[]", CFStringBuiltInEncodings.UTF8.rawValue)
                
                pairs.append( "\(key)=\(escapedFormat)")
            }
        }
        
        let str = pairs.joinWithSeparator("&")
        return str
    }
    
    public class func asParams(params: Dictionary<String, AnyObject>, arrayEncodingStrategy: ArrayEncodingStrategy = ArrayEncodingStrategy.MultiParam) -> NSData {
        return asParamsStr(params, arrayEncodingStrategy: arrayEncodingStrategy).dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    public class func delete(url:String, body: NSData = emptyBody, headers: Dictionary<String, AnyObject> = [:]) -> Future<HTTPResponse, NSError> {
        return request(url, requestMethod: RequestMethod.DELETE, body: body, headers: headers)
    }
    
    public class func get(url:String, headers: Dictionary<String, AnyObject> = [:]) -> Future<HTTPResponse, NSError> {
        return request(url, requestMethod: RequestMethod.GET, body: emptyBody, headers: headers)
    }
    
    public class func post(url:String, body: NSData = emptyBody, headers: Dictionary<String, AnyObject> = [:]) -> Future<HTTPResponse, NSError> {
        return request(url, requestMethod: RequestMethod.POST, body: body, headers: headers)
    }
    
    public class func put(url:String, body: NSData = emptyBody, headers: Dictionary<String, AnyObject> = [:]) -> Future<HTTPResponse, NSError> {
        return request(url, requestMethod: RequestMethod.PUT, body: body, headers: headers)
    }
    
    public class func options(url:String, headers: Dictionary<String, AnyObject> = [:]) -> Future<HTTPResponse, NSError> {
        return request(url, requestMethod: RequestMethod.OPTIONS, body: emptyBody, headers: headers)
    }
    
    public class func request(url:String, requestMethod: RequestMethod, body: NSData, headers: Dictionary<String, AnyObject>) -> Future<HTTPResponse, NSError> {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = requestMethod.rawValue
        request.HTTPBody = body
        
        for (headerKey, headerValue) in headers {
            if let multiHeader = headerValue as? [String] {
                for str in multiHeader {
                    request.addValue(str, forHTTPHeaderField: headerKey)
                }
            } else {
                request.addValue(headerValue as! String, forHTTPHeaderField: headerKey)
            }
        }
        
        let promise = Promise<HTTPResponse, NSError>()
        
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error -> Void in
            let data: NSData = (data != nil ? data! : NSData())
            
            if let error = error {
                promise.completeWith(error)
            } else {
                let httpResponse = response as! NSHTTPURLResponse
                
                var responseHeaders:Dictionary<String, AnyObject> = [:]
                for (headerKey, headerValue) in httpResponse.allHeaderFields {
                    responseHeaders[headerKey as! String] = headerValue
                }
            
                promise.completeWith(HTTPResponse(statusCode: httpResponse.statusCode, body: data, headers: responseHeaders))
            }
        })
        
        task.resume()
        return promise.future
    }
}
