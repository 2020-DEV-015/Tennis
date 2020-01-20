import XCTest
@testable import Tennis

class PlayerTests: XCTestCase {

    func testPlayerCreatedWithGivenName() {
        let playerA = Player(name: "Player A")
        XCTAssertEqual("Player A", playerA.name)
    }
    
    func testPlayerScoreIsZeroWhenPlayerCreated() {
        let playerA = Player(name: "Player B")
        XCTAssertEqual(0, playerA.points)
    }
}
