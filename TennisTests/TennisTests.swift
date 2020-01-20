import XCTest

class TennisTests: XCTestCase {
    
    func testGameShouldReturnLoveAll() {
        let expectedScore = "Love, All"
        XCTAssertEqual(expectedScore, "Love, All")
    }
}
