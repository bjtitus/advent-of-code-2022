import Foundation
import Algorithms

struct Day3 {
    static func compartmentsPrioritySum(_ string: String) -> Int {
        let rucksacks = StringParser.map(string, RucksackCompartmentsParseStrategy())
        let commonItems = rucksacks.compactMap { rucksack -> Set<Character>? in
            guard let rucksack,
                  let firstCompartment = rucksack.compartments.first else {
                return nil
            }

            let secondIndex = rucksack.compartments.index(after: rucksack.compartments.startIndex)
            let secondCompartment = rucksack.compartments[secondIndex]

            return firstCompartment.intersection(secondCompartment)
        }

        let total = commonItems.flatMap({ $0.map { value(for: $0) }}).reduce(0, +)
        return total
    }

    static func badgePrioritySum(_ string: String) -> Int {

        let groupSize = 3

        let groups = StringParser.values(string).filter({ $0.isEmpty == false })
            .map({ Set<Character>($0) }) // Maps the String to a set of characters
            .chunks(ofCount: groupSize) // Collects groups by 3

        // The common badges in each group
        let groupBadges = groups.flatMap({ group in
            guard let first = group.first else {
                return Set<Character>()
            }

            let groupAfterFirst = group.suffix(group.count - 1)
            // Collects the intersections of the Character Sets
            return groupAfterFirst.reduce(first) { accumulator, set in
                return accumulator.intersection(set)
            }
        })

        // The total value of each group's badge
        return groupBadges.map { value(for: $0) }.reduce(0, +)
    }

    /// Fetches the value from `letterValues` for the specified character
    /// - Parameter char: The character for which to fetch the value.
    /// - Returns: The score value of that character
    static func value(for char: Character) -> Int {
        return letterValues[char] ?? 0
    }

    /// The values of each letter in the basic Latin alphabet as described in Day 3's puzzle.
    static var letterValues: Dictionary<Character, Int> {
        let lowercase = scored(letters: String.basicLatinLetters, values: 1...26)
        let uppercase = scored(letters: String.basicLatinLetters.uppercased(), values: 27...52)

        return lowercase.merging(uppercase) { (_, new) in new }
    }

    private static func scored<Value: Sequence>(letters: String, values: Value) -> [Character: Value.Element] {
        let characters = letters.unicodeScalars.map({ Character($0) })
        return Dictionary(uniqueKeysWithValues: zip(characters, values))
    }
}

private extension String {
    /// A string containing all basic latin letters (a-z) in lowercase.
    static var basicLatinLetters: String {
        return "abcdefghijklmnopqrstuvwxyz"
    }
}
