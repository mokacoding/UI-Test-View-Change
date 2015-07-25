//
//  UI_Test_View_ChangeUITests.swift
//  UI-Test-View-ChangeUITests
//
//  Created by Giovanni on 24/07/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import XCTest

class UI_Test_View_ChangeUITests: XCTestCase {

  override func setUp() {
    super.setUp()

    continueAfterFailure = false
    XCUIApplication().launch()
  }

  func testButtonChangesAfterTimeout() {
    let app = XCUIApplication()

    let expectedText = "Now you can press me"
    let identifier = "lunatic button"

    let testPredicate = NSPredicate(format: "label = '\(expectedText)'")
    let object = app.buttons.elementMatchingType(XCUIElementType.Button, identifier: identifier)

    self.expectationForPredicate(testPredicate, evaluatedWithObject: object, handler: nil)
    self.waitForExpectationsWithTimeout(10, handler: nil)
  }

  func testOtherButtonChangesFooter() {
    let app = XCUIApplication()

    let expectedText = "Oh! Did something happen?!"
    let labelIdentifier = "footer label"

    let testPredicate = NSPredicate(format: "label = '\(expectedText)'")
    let object = app.staticTexts.elementMatchingType(.Any, identifier: labelIdentifier)

    self.expectationForPredicate(testPredicate, evaluatedWithObject: object, handler: nil)

    app.buttons["Press me and I'll do something, eventually"].tap()

    self.waitForExpectationsWithTimeout(10, handler: nil)
  }

}
