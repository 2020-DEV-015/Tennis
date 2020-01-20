class Player {
    private(set) var name: String
    private(set) var points: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func scored() {
        self.points = self.points + 1
    }
}
