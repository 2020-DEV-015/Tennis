import UIKit

class TennisView: UIViewController {
    
    @IBOutlet weak private var playerALabel: UILabel!
    @IBOutlet weak private var playerBLabel: UILabel!
    
    @IBOutlet weak private var playerAPlayButton: UIButton!
    @IBOutlet weak private var playerBPlayButton: UIButton!
    
    @IBOutlet weak private var gameScoreLabel: UILabel!

    lazy private var tennisPresenter: TennisPresenter = {
        let tennis = Tennis(playerA: Player(name: "Player One"), playerB: Player(name: "Player Two"))
        return TennisPresenter(tennis: tennis, delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    private func startGame() {
        tennisPresenter.startGame()
    }
    
    @IBAction func playerAPlays(_ sender: UIButton) {
        tennisPresenter.servedBall(byPlayer: .playerA)
    }
    
    @IBAction func playerBPlays(_ sender: UIButton) {
        tennisPresenter.servedBall(byPlayer: .playerB)
    }
}

extension TennisView: TennisViewDelegate {
    
    func showPlayerNames(playerA: String, playerB: String) {
        playerALabel.text = playerA
        playerBLabel.text = playerB
    }
    
    func updateGameScore(score: String) {
        gameScoreLabel.text = score
        if score.lowercased().contains("won") {
            playerAPlayButton.isEnabled = false
            playerBPlayButton.isEnabled = false
        }
    }
    
    func enablePlay(forPlayer player: PlayerSide) {
        playerAPlayButton.isEnabled = (player == .playerA)
        playerBPlayButton.isEnabled = (player == .playerB)
    }
}
