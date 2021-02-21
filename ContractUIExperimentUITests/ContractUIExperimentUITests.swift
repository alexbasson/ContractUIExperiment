import XCTest

class ContractUIExperimentUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Butter"].exists)
        XCTAssertTrue(app.staticTexts["Flour"].exists)
        XCTAssertTrue(app.staticTexts["Sugar"].exists)
        XCTAssertTrue(app.staticTexts["Eggs"].exists)
        XCTAssertTrue(app.staticTexts["Lemons"].exists)
    }
}
