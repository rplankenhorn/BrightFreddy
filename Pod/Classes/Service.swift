//
//  Service.swift
//  Pods
//
//  Created by Robbie Plankenhorn on 3/10/16.
//
//

import Foundation
import BrightFutures
import Freddy
import Result

public protocol ServiceEnvironment {
    func baseUrl() -> String
    func fullURLWithResourcePath(path:String) -> String
}

public class Service {
    
    public static var environment:ServiceEnvironment? = nil
    
    private class func fullURLWithPath(path:String) -> String {
        var fullUrl = path
        
        if let e = environment {
            fullUrl = e.fullURLWithResourcePath(path) ?? path
        }
        
        return fullUrl
    }
    
    // MARK: Get JSON Object
    
    public class func getJSONObject(path: String, headers: [String : String] = [:], dotPath: String? = nil) -> Future<JSON, NSError> {
        return ServiceUtil.get(fullURLWithPath(path), headers: headers).flatMap { response -> Result<JSON, NSError> in
            do {
                let json = try response.bodyJSON()
                
                if let dotPath = dotPath, let jsonDotPathObject = json[dotPath] {
                    return Result.Success(jsonDotPathObject)
                } else {
                    return Result.Success(json)
                }
            } catch {
                return Result.Failure(NSError(domain: "", code: 0, userInfo: nil))
            }
        }
    }
    
    // MARK: Get Object
    
    public class func getObject<T: JSONDecodable>(path: String, headers: [String : String] = [:], dotPath: String? = nil) -> Future<T, NSError> {
        return getJSONObject(path, headers: headers, dotPath: dotPath).flatMap { json -> Result<T, NSError> in
            do {
                let object = try T(json: json)
                return Result.Success(object)
            } catch {
                return Result.Failure(NSError(domain: "", code: 0, userInfo: nil))
            }
        }
    }
    
    // MARK: Get Objects
    
    public class func getObjects<T: JSONDecodable>(path: String, headers: [String : String] = [:], dotPath: String? = nil) -> Future<[T], NSError> {
        return getJSONObject(path, headers: headers).flatMap { json -> Result<[T], NSError> in
            do {
                if case .Array(let jsonObjects) = json {
                    var objects = [T]()
                    
                    for jsonObject in jsonObjects {
                        objects.append(try T(json: jsonObject))
                    }
                    
                    return Result.Success(objects)
                }
            } catch {
                
            }
            
            return Result.Failure(NSError(domain: "", code: 0, userInfo: nil))
        }
    }
    
    // MARK: Post JSON Object
    
    public class func postJSONObject(object: JSON, path: String, headers: [String : String] = [:]) -> Future<JSON, NSError> {
        do {
            let body = try object.serialize()
            return ServiceUtil.post(fullURLWithPath(path), body: body, headers: headers).flatMap { response -> Result<JSON, NSError> in
                do {
                    let json = try response.bodyJSON()
                    return Result.Success(json)
                } catch {
                    return Result.Failure(NSError(domain: "", code: 0, userInfo: nil))
                }
            }
        } catch {
            return Promise<JSON, NSError>().completeWith(NSError(domain: "", code: 0, userInfo: nil)).future
        }
    }
    
    // MARK: Post Object
    
    public class func postObject<T: JSONEncodable, D: JSONDecodable>(object: T, path: String, headers: [String : String] = [:]) -> Future<D, NSError> {
        return postJSONObject(object.toJSON(), path: path, headers: headers).flatMap { json -> Result<D, NSError> in
            do {
                let object = try D(json: json)
                return Result.Success(object)
            } catch {
                return Result.Failure(NSError(domain: "", code: 0, userInfo: nil))
            }
        }
    }

}
