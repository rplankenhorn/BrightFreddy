//
//  GetTests.swift
//  BrightFreddy
//
//  Created by Robbie Plankenhorn on 3/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import BrightFreddy
@testable import BrightFutures
@testable import Freddy

class GetTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetJSONObject1() {
        let expectation = expectationWithDescription("testGetJSONObject1")
        
        Service.getJSONObject("http://jsonplaceholder.typicode.com/posts/1").onSuccess { json in
            print("Success")
        }.onFailure { error in
            XCTFail(error.description)
        }.onCompleteFulfill(expectation)
        
        waitForExpectationsWithTimeoutAndPrint(15)
    }
    
    func testGetObject1() {
        let expectation = expectationWithDescription("testGetObject1")
        
        let responseObject = Post(title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", userId: 1, id: 1, body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
        
        Service.getObject(Post.self, path: "http://jsonplaceholder.typicode.com/posts/1").onSuccess { object in
            XCTAssert(responseObject == object)
        }.onFailure { error in
            XCTFail(error.description)
        }.onCompleteFulfill(expectation)
        
        waitForExpectationsWithTimeoutAndPrint(15)
    }
    
    func testGetObjects1() {
        let expectation = expectationWithDescription("testGetObjects1")
        
        Service.getObjects(Post.self, path: "http://jsonplaceholder.typicode.com/posts").onSuccess { objects in
            print(objects)
        }.onFailure { error in
            XCTFail(error.description)
        }.onCompleteFulfill(expectation)
        
        waitForExpectationsWithTimeoutAndPrint(15)
    }
}

struct Post {
    var title:String
    var userId:Int
    var id:Int
    var body:String
}

extension Post: JSONDecodable {
    init(json: JSON) throws {
        title = try json.string("title")
        userId = try json.int("userId")
        id = try json.int("id")
        body = try json.string("body")
    }
}

extension Post: Equatable {
    
}

func ==(lhs: Post, rhs: Post) -> Bool {
    return lhs.title == rhs.title && lhs.userId == rhs.userId && lhs.id == rhs.id && lhs.body == rhs.body
}

