import XCTest
@testable import Tennis
class TennisPresenterTests: XCTestCase {

    private var mockTennisViewDelegate: MockTennisViewDelegate = MockTennisViewDelegate()
    private var tennisPresenter: TennisPresenter!
    
    override func setUp() {
        super.setUp()
        let tennis = Tennis(playerA: Player(name: "Player A"), playerB: Player(name: "Player B"))
        tennisPresenter = TennisPresenter(tennis: tennis, delegate: mockTennisViewDelegate)
    }
    
    override func tearDown() {
        super.tearDown()
        mockTennisViewDelegate.reset()
    }
    
    func testShowPlayersNameCalledOnGameStart() {
        tennisPresenter.startGame()
        XCTAssertTrue(mockTennisViewDelegate.showPlayerNamesCalled)
    }
    
    func testUpdateGameScoreCalledAfterPlayerAServesBall() {
        tennisPresenter.playerAServesBall()
        XCTAssertTrue(mockTennisViewDelegate.updateGameScoreCalled)
    }

    func testUpdateGameScoreCalledAfterPlayerBServesBall() {
        tennisPresenter.playerBServesBall()
        XCTAssertTrue(mockTennisViewDelegate.updateGameScoreCalled)
    }
}
