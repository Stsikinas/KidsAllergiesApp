//
//  KidsAllergiesAppTests.swift
//  KidsAllergiesAppTests
//
//  Created by Epsilon User on 4/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import XCTest
@testable import Kids_Allergies

class KidsAllergiesAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidPassword() throws {
        XCTAssertTrue(AppUtility.isValid("Mmiler#13", forRules: "required: lower; required: upper; required: digit; minlength: 8;"))
    }
    
    func testValidEmail() throws {
        XCTAssert("s.tsikinas@gmail.com".isEmailValid())
    }

}
