import Foundation

public struct Day2 {
    public static func score(_ string: String) -> Int {
        let strategies = StringParser.map(string, RoshamboParseStrategy())
        let score = strategies.reduce(0) { result, value in
            guard let value else {
                return result
            }
            return result + value.response.score + value.response.outcome(opponent: value.opponent).score
        }
        return score
    }

    public static func scorePart2(_ string: String) -> Int {
        let strategies = StringParser.map(string, RoshamboResultParseStrategy())
        let score = strategies.reduce(0) { result, value in
            guard let value else {
                return result
            }
            let move = value.opponent.move(outcome: value.result)
            return result + move.score + move.outcome(opponent: value.opponent).score
        }
        return score
    }

}
