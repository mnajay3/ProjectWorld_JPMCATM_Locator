//
//  JPMCATMLocatorTests.swift
//  JPMCATMLocatorTests
//
//  Created by Naga Murala on 1/31/18.
//  Copyright © 2018 Naga Murala. All rights reserved.
//

import XCTest
@testable import JPMCATMLocator

class JPMCATMLocatorTests: XCTestCase {
    var locatorController = ATMLocatorViewController()
    var locatorViewModel = ATMLocatorViewModel()
    
    override func setUp() {
        super.setUp()
        locatorController.viewModel = locatorViewModel
        locatorController.viewModel.currentLatitude = 40.75933
        locatorController.viewModel.currentLongitude = -73.99481
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testIsQueryParmStringAvailable() {
        let queryString = locatorController.viewModel.prepareQueryParmString()
        XCTAssertTrue(!queryString.isEmpty)
    }
    
    func testExpectedQueryString() {
        let querystring = locatorController.viewModel.prepareQueryParmString()
        let expectedString = "lat=40.75933&lng=-73.99481"
        XCTAssertEqual(expectedString, querystring)
    }
    
    func testURL() {
        let isUrlAvailable = locatorController.viewModel.prepareURL()
        XCTAssertTrue(isUrlAvailable != nil)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testNetworkResponse() {
        var response : ATMLocatorResponse?
        let url = locatorController.viewModel.prepareURL()
        let expected = expectation(description: "Chase serive does some stuff in background thread and runs the call back")
        locatorController.viewModel.invokeServiceWithURL(url: url) {
//            XCTAssertTrue(self.locatorController.viewModel.locationResponse != nil)
            response = self.locatorController.viewModel.locationResponse
            XCTAssertTrue(response != nil)
            expected.fulfill()
//            self.expectation(description: expected.description).fulfill()
        }
        waitForExpectations(timeout: 2) { (error) in
            if let error = error {
                XCTFail("Wait for expectation time out and error occured:\(error)")
            }
        }
    }
 
    
}
