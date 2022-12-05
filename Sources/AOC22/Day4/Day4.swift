import Foundation
import os

struct Day4 {
    static func fullyContained(_ string: String) -> Int {

        let components = StringParser.map(string, GroupAssignmentsParseStrategy())

        // Calculate full overlap of pairs
        let fullyContained = components.map({ result in
            guard let result else {
                return false
            }
            let first = result.0
            let second = result.1

            return eitherFullyContain(first: first, second: second)
        })

        return fullyContained.filter({ $0 == true }).count
    }

    static func overlaps(_ string: String) -> Int {
        let components = StringParser.map(string, GroupAssignmentsParseStrategy())

        // Calculate full overlap of pairs
        let fullyContained = components.map({ result in
            guard let result else {
                return false
            }
            let first = result.0
            let second = result.1

            return first.overlaps(second) || second.overlaps(first)
        })

        return fullyContained.filter({ $0 == true }).count
    }

    static func eitherFullyContain<T: CustomStringConvertible>(first: ClosedRange<T>, second: ClosedRange<T>) -> Bool {
        return first.fullyContains(second) || second.fullyContains(first)
    }
}

extension ClosedRange {
    /// Checks whether this range is fully contained within the second range.
    /// - Parameter other: The range which should contain this range.
    /// - Returns: Whether `other` fully contains this range.
    func fullyContains(_ other: ClosedRange) -> Bool {
        // Not sure that both `overlaps` and `clamped` is needed here.
        // I thought the overlaps check would prevent having to clamp, but it may not.
        return self.overlaps(other) && clamped(to: other) == self
    }
}
