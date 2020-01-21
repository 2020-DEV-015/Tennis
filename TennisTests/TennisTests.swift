import XCTest
@testable import Tennis

class TennisTests: XCTestCase {
    
    private var playerA: Player!
    private var playerB: Player!
    private var tennis: Tennis!
    
    override func setUp() {
        super.setUp()
        playerA = Player(name: "Player A")
        playerB = Player(name: "Player B")
        tennis = Tennis(playerA: playerA, playerB: playerB)
    }
    
    func testPlayerAName() {
        let expectedName = "Player A"
        XCTAssertEqual(expectedName, tennis.getPlayerAName())
    }
    
    func testPlayerBName() {
        let expectedName = "Player B"
        XCTAssertEqual(expectedName, tennis.getPlayerBName())
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

    func testPlayerAWinsTheGame() {
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
    
    func testPlayerAHasAdvantage() {
        increaseGame(pointBy: 3, forPlayer: playerB)
        increaseGame(pointBy: 4, forPlayer: playerA)
        let expectedScore = "Player A Has Advantage"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerAHasWonAfterAdvantage() {
        increaseGame(pointBy: 3, forPlayer: playerB)
        increaseGame(pointBy: 5, forPlayer: playerA)
        let expectedScore = "Player A Has Won"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerBWins_0_1() {
        increaseGame(pointBy: 1, forPlayer: playerB)
        let expectedScore = "Love,Fifteen"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerBWins_1_2() {
        increaseGame(pointBy: 1, forPlayer: playerA )
        increaseGame(pointBy: 2, forPlayer: playerB)
        let expectedScore = "Fifteen,Thirty"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerBWins_1_3() {
        increaseGame(pointBy: 1, forPlayer: playerA )
        increaseGame(pointBy: 3, forPlayer: playerB)
        let expectedScore = "Fifteen,Forty"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerBWinsTheGame() {
        increaseGame(pointBy: 1, forPlayer: playerA )
        increaseGame(pointBy: 4, forPlayer: playerB )
        let expectedScore = "Player B Has Won"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerBHasAdvantage() {
        increaseGame(pointBy: 3, forPlayer: playerA )
        increaseGame(pointBy: 4, forPlayer: playerB)
        let expectedScore = "Player B Has Advantage"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    func testPlayerBHasWonAfterAdvantage() {
        increaseGame(pointBy: 4, forPlayer: playerA )
        increaseGame(pointBy: 6, forPlayer: playerB)
        let expectedScore = "Player B Has Won"
        XCTAssertEqual(expectedScore, tennis.getScore())
    }
    
    private func increaseGame(pointBy: Int, forPlayer player: Player) {
        let range = pointBy
        for _ in 1...range {
            player.scored()
        }
    }
}
