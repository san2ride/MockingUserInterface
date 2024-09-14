//
//  MockUIUserInterfaceTests.swift
//  MockUIUserInterfaceTests
//
//  Created by Jason Sanchez on 9/14/24.
//

import XCTest

class when_user_taps_on_login_button: XCTestCase {

    func test_should_display_error_message_for_missing_required_fields() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
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
}
