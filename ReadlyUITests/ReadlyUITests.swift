//
//  ReadlyUITests.swift
//  ReadlyUITests
//
//  Created by Viorel Rinja on 5/19/21.
//

import XCTest

class ReadlyUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_punchline_reachable() {
        let app = XCUIApplication()
        app.launchArguments = ["-ui-test"]
        app.launch()
        
        app.tabBars.buttons.element(boundBy: 2).tap()
        app.cells.element(boundBy: 0).tap()
        let image = app.images.element(boundBy: 0)
        XCTAssertNotNil(image)
    }
}
