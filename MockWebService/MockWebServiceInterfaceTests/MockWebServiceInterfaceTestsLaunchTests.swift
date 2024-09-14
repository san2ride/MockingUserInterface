//
//  MockWebServiceInterfaceTestsLaunchTests.swift
//  MockWebServiceInterfaceTests
//
//  Created by Jason Sanchez on 9/14/24.
//

import XCTest

class MockWebServiceInterfaceTestsLaunchTests: XCTestCase {

    func test_should_display_error_message_for_missing_required_fields() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        
        XCTAssertEqual(messageText.label, "Required fields are missing")
        
    }
}
