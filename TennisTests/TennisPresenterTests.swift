import XCTest
@testable import Tennis

class MockTennisViewDelegate: TennisViewDelegate {
    
    fileprivate var showPlayerNamesCalled = false
    fileprivate var playerAName: String? = nil
    fileprivate var playerBName: String? = nil
    
    func showPlayerNames(playerA: String, playerB: String) {
        self.showPlayerNamesCalled = true
        self.playerAName = playerA
        self.playerBName = playerB
    }
}
class TennisPresenterTests: XCTestCase {

    private var mockTennisViewDelegate: MockTennisViewDelegate = MockTennisViewDelegate()
    private var tennisPresenter: TennisPresenter!
    
    override func setUp() {
        super.setUp()
        let tennis = Tennis(playerA: Player(name: "Player A"), playerB: Player(name: "Player B"))
        tennisPresenter = TennisPresenter(tennis: tennis, delegate: mockTennisViewDelegate)
    }
    
    func testShowPlayersNameCalledOnGameStart() {
        tennisPresenter.startGame()
        XCTAssertTrue(mockTennisViewDelegate.showPlayerNamesCalled)
    }
}
