//
//  CS_GO_Weapon_StatsUITestsLaunchTests.swift
//  CS-GO-Weapon-StatsUITests
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import XCTest

class CS_GO_Weapon_StatsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
