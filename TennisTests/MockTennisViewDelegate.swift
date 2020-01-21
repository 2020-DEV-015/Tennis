@testable import Tennis
class MockTennisViewDelegate: TennisViewDelegate {
    
    var showPlayerNamesCalled = false
    var updateGameScoreCalled = false
    var playerAName: String? = nil
    var playerBName: String? = nil
    var gameScore: String? = nil
    
    func showPlayerNames(playerA: String, playerB: String) {
        self.showPlayerNamesCalled = true
        self.playerAName = playerA
        self.playerBName = playerB
    }
    
    func updateGameScore(score: String) {
        self.updateGameScoreCalled = true
        self.gameScore = score
    }
    
    func reset() {
        self.showPlayerNamesCalled = false
        self.playerBName = nil
        self.playerBName = nil
        self.updateGameScoreCalled = false
        self.gameScore = nil
    }
}
