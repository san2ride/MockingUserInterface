//
//  MockUIUserInterfaceTests.swift
//  MockUIUserInterfaceTests
//
//  Created by Jason Sanchez on 9/14/24.
//

import XCTest

class when_user_taps_on_login_button: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV" : "TEST"]
        app.launch()
    }

    func test_should_display_error_message_for_missing_required_fields() {
        
        let userNameTextField = app.textFields["usernameTextField"]
        userNameTextField.tap()
        userNameTextField.typeText("")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    func test_should_navigate_to_dashboard_page_when_authenticated() {
        let userNameTextField = app.textFields["usernameTextField"]
        userNameTextField.tap()
        userNameTextField.typeText("JohnDoe")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let dashboardNavBarTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
    }
}
