import XCTest
@testable import Tennis

class TennisTests: XCTestCase {
    
    func testNewGameShouldReturnLoveAll() {
        let tennis = Tennis()
        let expectedScore = "Love, All"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
}
