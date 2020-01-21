
protocol TennisViewDelegate: AnyObject {
    func showPlayerNames(playerA: String, playerB: String)
    func updateGameScore(score: String)
    func enablePlay(forPlayer player: PlayerSide)
}

class TennisPresenter {
    
    private var tennis: Tennis
    weak var tennisViewDelegate: TennisViewDelegate?
    
    init(tennis: Tennis, delegate: TennisViewDelegate) {
        self.tennis = tennis
        self.tennisViewDelegate = delegate
    }
    
    func startGame() {
        let playerNameA = self.tennis.getPlayerName(for: .playerA)
        let playerNameB = self.tennis.getPlayerName(for: .playerB)
        tennisViewDelegate?.showPlayerNames(playerA: playerNameA, playerB: playerNameB)
    }

    func servedBall(byPlayer player: PlayerSide) {
        if self.scoredOnServe() {
            self.tennis.scored(byPlayer: player)
            tennisViewDelegate?.enablePlay(forPlayer: player)
        } else {
            let scoredPlayer: PlayerSide = (player == .playerA ? .playerB: .playerA)
            self.tennis.scored(byPlayer: scoredPlayer)
            tennisViewDelegate?.enablePlay(forPlayer: scoredPlayer)
        }
        tennisViewDelegate?.updateGameScore(score: tennis.getScore())
    }
    
    private func scoredOnServe() -> Bool {
        return Bool.random()
    }
}
