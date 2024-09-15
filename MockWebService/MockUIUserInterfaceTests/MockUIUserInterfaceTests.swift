//
//  MockUIUserInterfaceTests.swift
//  MockUIUserInterfaceTests
//
//  Created by Jason Sanchez on 9/14/24.
//

import XCTest

class when_user_taps_on_login_button: XCTestCase {
    
    private var app: XCUIApplication!
    private var loginPageObject: LoginPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        loginPageObject = LoginPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV" : "TEST"]
        app.launch()
    }

    func test_should_display_error_message_for_missing_required_fields() {
        let userNameTextField = loginPageObject.usernameTextField
        userNameTextField.tap()
        userNameTextField.typeText("")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    func test_should_display_error_message_for_invalid_credentials() {
        let userNameTextField = loginPageObject.usernameTextField
        userNameTextField.tap()
        userNameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("WrongPassword")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        XCTAssertEqual(messageText.label, "Invalid credentials")
    }
    
    func test_should_navigate_to_dashboard_page_when_authenticated() {
        let userNameTextField = loginPageObject.usernameTextField
        userNameTextField.tap()
        userNameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let dashboardNavBarTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
    }
}
