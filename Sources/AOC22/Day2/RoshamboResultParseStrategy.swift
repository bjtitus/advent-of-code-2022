import Foundation

/// Parses a line with the format "A X"
/// Where A is the opponent's Roshambo move and X is the Roshambo outcome
struct RoshamboResultParseStrategy: ParseStrategy, Decodable {
    typealias ParseInput = String
    typealias ParseOutput = Strategy

    struct Strategy {
        let opponent: Roshambo
        let result: Roshambo.Outcome
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
        let response = Roshambo.Outcome(String(plays[1]))

        guard let opponent, let response else {
            throw RoshamboParseError.malformed
        }

        return Strategy(opponent: opponent, result: response)
    }
}

