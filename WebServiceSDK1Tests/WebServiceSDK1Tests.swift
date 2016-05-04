//
//  WebServiceSDK1Tests.swift
//  WebServiceSDK1Tests
//
//  Created by 廖慶麟 on 2016/4/27.
//  Copyright © 2016年 廖慶麟. All rights reserved.
//

import XCTest
@testable import WebServiceSDK1

class WebServiceSDK1Tests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    var manager = APIManager()
    
    func testFetchGetResponse(){
        let expectation = expectationWithDescription("Get request should succeed!")

        manager.fetchGetResponse { (r, e) -> Void in
            guard let result = r else {
                XCTAssertNotNil(e)
                return
            }
            XCTAssertNotNil(result["args"])
            XCTAssertNotNil(result["headers"])
            XCTAssertNotNil(result["origin"])
            XCTAssertNotNil(result["url"])
            
            // Always call fulfill function at the end of callback
            // Sometimes it causes problems if called earlier.
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }

    }
    
    func testFetchImage(){

        
    }
    
    func testPostCustomerName(){
        let expectation = expectationWithDescription("Post request should succeed!")
        
        manager.postCustomerName(["customer": "Billy"]) { (r, e) -> Void in
            guard let result = r else {
                XCTAssertNotNil(e)
                return
            }
            XCTAssertNotNil(result["args"])
            XCTAssertNotNil(result["headers"])
            XCTAssertNotNil(result["origin"])
            XCTAssertNotNil(result["url"])
            XCTAssertNotNil(result["data"])
            XCTAssertNotNil(result["files"])
            XCTAssertEqual(result["form"]!["customer"], "Billy")
            XCTAssertNotNil(result["json"])
            
            expectation.fulfill()

        }
        
        waitForExpectationsWithTimeout(5, handler: nil)
    }
}
