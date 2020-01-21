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
    
    func testShowPlayersNameCalledOnGameStart() {
        let tennisPresenter = TennisPresenter()
        tennisPresenter.tennisViewDelegate = mockTennisViewDelegate
        tennisPresenter.startGame()
        XCTAssertTrue(mockTennisViewDelegate.showPlayerNamesCalled)
    }
}
