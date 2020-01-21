
protocol TennisViewDelegate: AnyObject {
    func showPlayerNames(playerA: String, playerB: String)
    func updateGameScore(score: String)
}

class TennisPresenter {
    
    private var tennis: Tennis
    weak var tennisViewDelegate: TennisViewDelegate?
    
    init(tennis: Tennis, delegate: TennisViewDelegate) {
        self.tennis = tennis
        self.tennisViewDelegate = delegate
    }
    
    func startGame() {
        tennisViewDelegate?.showPlayerNames(playerA: self.tennis.getPlayerAName(), playerB: self.tennis.getPlayerBName())
    }

    func playerAServesBall() {
        tennisViewDelegate?.updateGameScore(score: tennis.getScore())
    }

    func playerBServesBall() {
        tennisViewDelegate?.updateGameScore(score: tennis.getScore())
    }
}
