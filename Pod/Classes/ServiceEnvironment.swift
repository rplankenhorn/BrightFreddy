//
//  ServiceEnvironment.swift
//  Pods
//
//  Created by Robbie Plankenhorn on 4/20/16.
//
//

import Foundation

public protocol ServiceEnvironment {
    func baseUrl() -> String
    func fullURLWithResourcePath(path:String) -> String
}

extension Service {
    
    public static var environment:ServiceEnvironment? = nil
    
    class func fullURLWithPath(path:String) -> String {
        var fullUrl = path
        
        if let e = environment {
            fullUrl = e.fullURLWithResourcePath(path)
        }
        
        return fullUrl
    }
    
}