/// Represents a move in Roshambo a.k.a. Rock, Paper, Scissors
enum Roshambo {
    case rock
    case paper
    case scissors

    /// An initializer based on the instructions provided in AOC 22 Part 1
    /// - Parameter challenge: A string to parse. Where `A` == .rock, `B` == .paper, `C` == .scissors
    init?(challenge: String) {
        switch challenge {
        case "A":
            self = .rock
        case "B":
            self = .paper
        case "C":
            self = .scissors
        default:
            return nil
        }
    }

    /// An initializer based on the instructions provided in AOC 22 Part 1
    /// - Parameter response: A string to parse. Where `X` == .rock, `Y` == .paper, `Z` == .scissors
    init?(response: String) {
        switch response {
        case "X":
            self = .rock
        case "Y":
            self = .paper
        case "Z":
            self = .scissors
        default:
            return nil
        }
    }

    /// The point value of a Roshambo move based on instructions from AOC 22 Part 1
    var score: Int {
        switch self {
        case .rock:
            return 1
        case .paper:
            return 2
        case .scissors:
            return 3
        }
    }

    /// The Outcome of a Roshambo move
    enum Outcome {
        case win
        case lose
        case draw

        /// An initializer based on the instructions provided in AOC 22 Part 2
        /// - Parameter string: A string to parse. Where `X` == .lose, `Y` == .draw, `Z` == .win
        init?(_ string: String) {
            switch string {
            case "X":
                self = .lose
            case "Y":
                self = .draw
            case "Z":
                self = .win
            default:
                return nil
            }
        }

        /// The point value of a Roshambo outcome based on instructions from AOC 22 Part 1
        var score: Int {
            switch self {
            case .lose:
                return 0
            case .draw:
                return 3
            case .win:
                return 6
            }
        }
    }

    /// The outcome of the current move played against `opponent`.
    /// - Parameter opponent: The opponent's `Roshambo` move.
    /// - Returns: The `Roshambo.Outcome` acheived from playing `Self` against the opponent move.
    func outcome(opponent: Roshambo) -> Outcome {
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissors:
                return .win
            }
        case .paper:
            switch opponent {
            case .paper:
                return .draw
            case .rock:
                return .win
            case .scissors:
                return .lose
            }
        case .scissors:
            switch opponent {
            case .scissors:
                return .draw
            case .rock:
                return .lose
            case .paper:
                return .win
            }
        }
    }

    /// Given an `outcome`, returns the `Roshambo` move required to achieve it when played against `Self`
    /// - Parameter outcome: The `Roshambo.Outcome` to achieve by playing the resulting move.
    /// - Returns: The `Roshambo` move to play to acheive `outcome` when played against `Self`
    func move(outcome: Outcome) -> Roshambo {
        switch outcome {
        case .draw:
            return self
        case .lose:
            switch self {
            case .rock:
                return .scissors
            case .paper:
                return .rock
            case .scissors:
                return .paper
            }
        case .win:
            switch self {
            case .rock:
                return .paper
            case .paper:
                return .scissors
            case .scissors:
                return .rock
            }
        }
    }
}
