//
//  Helpers.swift
//  BrightFreddy
//
//  Created by Robbie Plankenhorn on 3/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import BrightFreddy
@testable import BrightFutures

extension XCTestCase {
    
    func waitForExpectationsWithTimeoutAndPrint(time:NSTimeInterval) {
        waitForExpectationsWithTimeout(time) { error in
            if let error = error { print("Error: \(error.localizedDescription)") }
        }
    }
    
}

extension Future {
    
    public func onCompleteFulfill(expectation:XCTestExpectation) -> Future<T, E> {
        self.onComplete {_ in
            expectation.fulfill()
        }
        return self
    }
    
}