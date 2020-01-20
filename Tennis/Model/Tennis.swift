class Tennis {
    
    private var playerA: Player
    private var playerB: Player
    private let scores: [String] = ["Love", "Fifteen", "Thirty", "Forty"]
    
    init(playerA: Player, playerB: Player) {
        self.playerA = playerA
        self.playerB = playerB
    }

    func getScore() -> String {
        let playerAScore = getScore(forThePoint: playerA.points)
        if playerA.points == playerB.points {
            return playerAScore + "," + "All"
        }
        return playerAScore + "," + getScore(forThePoint: playerB.points)
    }
    
    private func getScore(forThePoint point: Int) -> String {
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
