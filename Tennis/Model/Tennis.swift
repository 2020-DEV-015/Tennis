class Tennis {
    
    private var playerA: Player
    private var playerB: Player
    private let scores: [String] = ["Love", "Fifteen", "Thirty", "Forty"]
    
    init(playerA: Player, playerB: Player) {
        self.playerA = playerA
        self.playerB = playerB
    }

    func getScore() -> String {
        let playerAScore = getScoreCall(forPoint: playerA.points)
        if playerA.points == playerB.points {
            return playerAScore + "," + "All"
        }
        return playerAScore + "," + getScoreCall(forPoint: playerB.points)
    }
    
    private func getScoreCall(forPoint point: Int) -> String {
        switch point {
        case 0:
            return "Love"
        case 1:
            return "Fifteen"
        case 2:
            return "Thirty"
        case 3:
            return "Forty"
        default:
            return "Invalid"
        }
    }
}
