import Foundation

/// Parses a line with the format "A X"
/// Where A is the opponent's Roshambo move and X is the player's move
struct RoshamboParseStrategy: ParseStrategy, Decodable {
    typealias ParseInput = String
    typealias ParseOutput = Strategy

    struct Strategy {
        let opponent: Roshambo
        let response: Roshambo
    }

    enum RoshamboParseError: Error {
        case malformed
        case empty
    }

    func parse(_ value: String) throws -> Strategy {
        guard value.isEmpty == false else {
            throw RoshamboParseError.empty
        }
        let plays = value.split(separator: .whitespace)

        let opponent = Roshambo(challenge: String(plays[0]))
        let response = Roshambo(response: String(plays[1]))

        guard let opponent, let response else {
            throw RoshamboParseError.malformed
        }

        return Strategy(opponent: opponent, response: response)
    }
}
