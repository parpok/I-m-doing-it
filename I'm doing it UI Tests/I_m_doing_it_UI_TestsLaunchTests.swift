//
//  I_m_doing_it_UI_TestsLaunchTests.swift
//  I'm doing it UI Tests
//
//  Created by Patryk Puciłowski on 14/02/2024.
//

import XCTest

final class I_m_doing_it_UI_TestsLaunchTests: XCTestCase {
    let app = XCUIApplication()

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testEmptyView() throws {
        app.launch()

        XCTAssertEqual(app.staticTexts["Good job"].label, "Good job")
    }

    func testEmptyTasksView() throws {
        app.launch()

        let addTaskButton = app.buttons["Show completed items"]
        addTaskButton.tap()
        XCTAssertEqual(app.staticTexts["No completed tasks"].label, "No completed tasks")
    }

//    func testAddingTasksViewExistence() throws {
//        app.launch()
//        app.buttons["Add task"].tap()
//
//    }
}
