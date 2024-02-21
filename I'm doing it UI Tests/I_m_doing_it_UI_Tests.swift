//
//  I_m_doing_it_UI_Tests.swift
//  I'm doing it UI Tests
//
//  Created by Patryk Puciłowski on 14/02/2024.
//

import XCTest

final class I_m_doing_it_UI_Tests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func testAddingTasks() throws {
//        app.launch()
//        app.buttons["Add task"].tap()
//        
//        let taskNameTextField = app.textFields["Task name"]
//        taskNameTextField.waitForExistence(timeout:)
//        taskNameTextField.tap()
//        taskNameTextField.typeText("Test task")
//        app.buttons["Afternoon"].tap()
//        app.buttons["Save task"].tap()
//        XCTAssert(app.textViews["Test task"].exists)
//    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
