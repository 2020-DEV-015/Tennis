import XCTest
@testable import Tennis

class TennisTests: XCTestCase {
    
    func testNewGameShouldReturnLoveAll() {
        let playerA = Player(name: "Player A")
        let playerB = Player(name: "Player B")
        let tennis = Tennis(playerA: playerA, playerB: playerB)
        let expectedScore = "Love,All"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
}
