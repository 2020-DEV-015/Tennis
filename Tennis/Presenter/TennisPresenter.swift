
protocol TennisViewDelegate: AnyObject {
    func showPlayerNames(playerA: String, playerB: String)
}

class TennisPresenter {
    weak var tennisViewDelegate: TennisViewDelegate?
    func startGame() {
        tennisViewDelegate?.showPlayerNames(playerA: "Player A", playerB: "Player B")
    }
}
