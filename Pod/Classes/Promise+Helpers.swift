//
//  Promise+Helpers.swift
//  BrightFreddy
//
//  Created by Robbie Plankenhorn on 3/10/16.
//
//

import Foundation
import BrightFutures
import Result

extension Promise {
    
    func completeWith(value: T) -> Promise<T, E> {
        self.complete(Result<T, E>(value: value))
        return self
    }
    
    func completeWith(error: E) -> Promise<T, E> {
        self.complete(Result<T, E>(error: error))
        return self
    }
    
}