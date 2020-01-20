import XCTest
@testable import Tennis

class TennisTests: XCTestCase {
    
    var playerA: Player!
    var playerB: Player!
    var tennis: Tennis!
    
    override func setUp() {
        super.setUp()
        playerA = Player(name: "Player A")
        playerB = Player(name: "Player B")
        tennis = Tennis(playerA: playerA, playerB: playerB)
    }
    
    func testNewGameShouldReturnLoveAll() {
        let expectedScore = "Love,All"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }

    func testPlayerAWinsFirstBall() {
        playerA.scored()
        let expectedScore = "Fifteen,Love"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerAWins_2_0() {
        playerA.scored()
        playerA.scored()
        let expectedScore = "Thirty,Love"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerAWins_3_0() {
        playerA.scored()
        playerA.scored()
        playerA.scored()
        let expectedScore = "Forty,Love"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }

    func testPlayerAWins_4_0() {
        playerA.scored()
        playerA.scored()
        playerA.scored()
        playerA.scored()
        let expectedScore = "Player A Has Won"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
}
