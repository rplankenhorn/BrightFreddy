//
//  HTTPResponse.swift
//  BrightFreddy
//
//  Created by Robbie Plankenhorn on 3/10/16.
//
//

import Foundation
import Freddy

let emptyBody:NSData =  "".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!

public class HTTPResponse {
    
    public let statusCode: Int
    public let body: NSData
    public let headers: Dictionary<String, AnyObject>
    
    private var bodyText: String?
    
    init(statusCode: Int, body: NSData, headers: Dictionary<String, AnyObject>) {
        self.statusCode = statusCode
        self.body = body
        self.headers = headers
    }
    
    public var bodyAsText: String {
        if let bodyT = self.bodyText {
            return bodyT
        } else {
            self.bodyText = NSString(data: body, encoding: NSUTF8StringEncoding)! as String
            return self.bodyText!
        }
    }
    
}

extension HTTPResponse {
    
    public func bodyJSON() throws -> JSON {
        return try self.body.jsonObject()
    }
    
}

extension NSData {
    
    func jsonObject() throws -> JSON {
        return try JSON(data: self)
    }
    
}