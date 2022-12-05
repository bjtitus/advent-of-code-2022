import Foundation

struct Rucksack<T: Hashable> {
    let compartments: [Set<T>]
}

struct RucksackCompartmentsParseStrategy: ParseStrategy {
    typealias ParseInput = String
    typealias ParseOutput = Rucksack<Character>

    enum RucksackParseError: Error {
        case empty
    }

    func parse(_ value: String) throws -> ParseOutput {
        guard value.isEmpty == false else {
            throw RucksackParseError.empty
        }

        let substrings = value.split(indices: value.middleIndex)
        let compartments = substrings.map { Set<Character>($0) }
        return Rucksack(compartments: compartments)
    }
}
