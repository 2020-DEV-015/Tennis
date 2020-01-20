class Tennis {
    
    private var playerA: Player
    private var playerB: Player
    private let scores: [String] = ["Love", "Fifteen", "Thirty", "Forty"]
    
    init(playerA: Player, playerB: Player) {
        self.playerA = playerA
        self.playerB = playerB
    }

    func getScore() -> String {
        return "Love, All"
    }
}
