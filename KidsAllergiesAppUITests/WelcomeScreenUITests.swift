//
//  WelcomeScreenUITests.swift
//  KidsAllergiesAppUITests
//
//  Created by Epsilon User on 13/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import XCTest

class WelcomeScreenUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Test regarding Welcome/Login Screen

    func testLoginUI() throws {
        XCUIApplication().launch()
        
        // Move to Login
        XCUIApplication().buttons.element.tap()
        
        let loginButton = XCUIApplication().buttons["loginBtn"]
        XCTAssertEqual(loginButton.isEnabled, false)
        // Add login Creds
        let userTextField = XCUIApplication().textFields["userTextField"]
        userTextField.tap()
        userTextField.typeText("test")
        sleep(2)
        XCTAssertEqual(loginButton.isEnabled, false)
        let passwordTextField = XCUIApplication().secureTextFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("test")
        // Show/hide password
        let toggleButton = XCUIApplication().buttons["toggleButton"]
        toggleButton.tap()
        sleep(5)
        toggleButton.tap()
        XCTAssertEqual(loginButton.isEnabled, true)
        sleep(2)
        loginButton.tap()
        // Check if login failed alert exists (wait 3 sec to show)
        let loginFailed = XCUIApplication().alerts.element
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: loginFailed, handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssert(loginFailed.exists)
        loginFailed.buttons.element.tap()
        sleep(2)
        
    }
    
    func testInvalidEmailRegisterView() throws {
        XCUIApplication().launch()
        
        // Move to Login
        XCUIApplication().buttons.element.tap()
        
        let loginButton = XCUIApplication().buttons["loginBtn"]
        XCTAssertEqual(loginButton.isEnabled, false)
        
        // Move to Register Screen
        let registerButton = XCUIApplication().buttons["registerBtn"]
        registerButton.tap()
        
        // Fill wrong user info
        let nameTextField = XCUIApplication().textFields["name"]
        nameTextField.tap()
        nameTextField.typeText("Steve")
        // Find toolbar button
        let doneButton = XCUIApplication().buttons["doneToolbar"]
        doneButton.tap()
        let lastnameTextField = XCUIApplication().textFields["surname"]
        lastnameTextField.tap()
        lastnameTextField.typeText("Doe")
        doneButton.tap()
        // Make sure that register button isn't enabled
        let doRegisterBtn = XCUIApplication().buttons["register"]
        XCTAssertFalse(doRegisterBtn.isEnabled)
        sleep(2)
        // Add wrong e-mail to show invalid e-mail alert
        let usernameTextField = XCUIApplication().textFields["email"]
        usernameTextField.tap()
        usernameTextField.typeText("wrong.email")
        doneButton.tap()
        let passwordTextField = XCUIApplication().secureTextFields["registerPass"]
        passwordTextField.tap()
        passwordTextField.typeText("Mmiller#13")
        doneButton.tap()
        sleep(3)
        // Make sure that register button is enabled
        XCTAssertTrue(doRegisterBtn.isEnabled)
        doRegisterBtn.tap()
        
    }
    
    func testInvalidPasswordRegisterView() throws {
        XCUIApplication().launch()
        
        // Move to Login
        XCUIApplication().buttons.element.tap()
        
        let loginButton = XCUIApplication().buttons["loginBtn"]
        XCTAssertEqual(loginButton.isEnabled, false)
        
        // Move to Register Screen
        let registerButton = XCUIApplication().buttons["registerBtn"]
        registerButton.tap()
        
        // Fill wrong user info
        let nameTextField = XCUIApplication().textFields["name"]
        nameTextField.tap()
        nameTextField.typeText("Steve")
        // Find toolbar button
        let doneButton = XCUIApplication().buttons["doneToolbar"]
        doneButton.tap()
        let lastnameTextField = XCUIApplication().textFields["surname"]
        lastnameTextField.tap()
        lastnameTextField.typeText("Doe")
        doneButton.tap()
        // Make sure that register button isn't enabled
        let doRegisterBtn = XCUIApplication().buttons["register"]
        XCTAssertFalse(doRegisterBtn.isEnabled)
        sleep(2)
        let usernameTextField = XCUIApplication().textFields["email"]
        usernameTextField.tap()
        usernameTextField.typeText("correct.email@email.com")
        doneButton.tap()
        // Add invalid password to show invalid alert
        let passwordTextField = XCUIApplication().secureTextFields["registerPass"]
        passwordTextField.tap()
        passwordTextField.typeText("12345")
        doneButton.tap()
        sleep(3)
        // Make sure that register button is enabled
        XCTAssertTrue(doRegisterBtn.isEnabled)
        doRegisterBtn.tap()
    }

}
