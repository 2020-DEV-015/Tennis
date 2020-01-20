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
        increaseGame(pointBy: 1, forPlayer: playerA)
        let expectedScore = "Fifteen,Love"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerAWins_2_0() {
        increaseGame(pointBy: 2, forPlayer: playerA)
        let expectedScore = "Thirty,Love"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerAWins_3_0() {
        increaseGame(pointBy: 3, forPlayer: playerA)
        let expectedScore = "Forty,Love"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }

    func testPlayerAWins_4_0() {
        increaseGame(pointBy: 4, forPlayer: playerA)
        let expectedScore = "Player A Has Won"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testGameDeuce() {
        increaseGame(pointBy: 4, forPlayer: playerA)
        increaseGame(pointBy: 4, forPlayer: playerB)
        let expectedScore = "Deuce"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerAAdvantage() {
        increaseGame(pointBy: 3, forPlayer: playerB)
        increaseGame(pointBy: 4, forPlayer: playerA)
        let expectedScore = "Player A Has Advantage"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerAHasWonAfterAdvantage() {
        increaseGame(pointBy: 3, forPlayer: playerB)
        increaseGame(pointBy: 4, forPlayer: playerA)
        increaseGame(pointBy: 1, forPlayer: playerA)
        let expectedScore = "Player A Has Won"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    private func increaseGame(pointBy: Int, forPlayer player: Player) {
        let range = pointBy
        for _ in 1...range {
            player.scored()
        }
    }
}
