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
    
    func getPlayerName(for player: PlayerSide) -> String {
        return  player == .playerA ? self.playerA.name: self.playerB.name
    }
    
    func scored(byPlayer player: PlayerSide) {
        if player == .playerA {
            self.playerA.scored()
        } else if player == .playerB {
            self.playerB.scored()
        }
    }
    
    func getScore() -> String {
        if gameHasWinner() {
            return leadingPlayerName() + " Has Won"
        }
        
        if gameReachedDeuce() {
            return "Deuce"
        }
        
        if playerHasAdvantage() {
            return leadingPlayerName() + " Has Advantage"
        }
        
        let playerAScore = getScoreCall(forPoint: playerAPoints)
        if playerAPoints == playerBPoints {
            return playerAScore + "," + "All"
        }
        return playerAScore + "," + getScoreCall(forPoint: playerBPoints)
    }

    private func gameReachedDeuce() -> Bool {
        if gameTied() && self.playerAPoints >= 3 && self.playerBPoints >= 3 {
            return true
        }
        return false
    }
    
    private func gameHasWinner() -> Bool {
        return playerHasWinningPoints() && playerLeadBy(point: TennisRules.winByPoints)
    }
    
    private func playerHasAdvantage() -> Bool {
        return playerHasWinningPoints() && playerLeadBy(point: TennisRules.advantagePoint)
    }
    
    private func gameTied() -> Bool {
        return playerAPoints == playerBPoints
    }
    
    private func playerHasWinningPoints() -> Bool {
        return playerAPoints >= TennisRules.winningPoints || playerBPoints >= TennisRules.winningPoints
    }
    
    private func playerLeadBy(point: Int) -> Bool {
        return playerBPoints <= (playerAPoints - point) || playerAPoints <= (playerBPoints - point)
    }
    
    private func leadingPlayerName() -> String {
        return playerAPoints > playerBPoints ? playerA.name: playerB.name
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
