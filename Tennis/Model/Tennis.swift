class Tennis {
    
    private var playerA: Player
    private var playerB: Player
    
    private var playerAPoints: Int {
        return self.playerA.points
    }
    private var playerBPoints: Int {
        return self.playerB.points
    }
    
    init(playerA: Player, playerB: Player) {
        self.playerA = playerA
        self.playerB = playerB
    }

    func getScore() -> String {
        if gameHasWinner() {
            return leadingPlayerName() + " Has Won"
        }
        let playerAScore = getScoreCall(forPoint: playerAPoints)
        if playerAPoints == playerBPoints {
            return playerAScore + "," + "All"
        }
        return playerAScore + "," + getScoreCall(forPoint: playerBPoints)
    }
    
    private func leadingPlayerName() -> String {
        return playerAPoints > playerBPoints ? playerA.name: playerB.name
    }
    
    private func gameHasWinner() -> Bool {
        if playerAPoints >= TennisRules.winningPoints && playerBPoints <= (playerAPoints - TennisRules.winByPoints){
            return true
        }
        if playerBPoints >= TennisRules.winningPoints && playerAPoints <= (playerBPoints - TennisRules.winByPoints){
            return true
        }
        return false
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
