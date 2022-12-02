import Foundation
import os

struct StringParser {

    static let logger = Logger(subsystem: "io.titus.aoc22", category: "StringParser")

    static func values(_ string: String) -> [String.SubSequence] {
        return string.split(omittingEmptySubsequences: false, whereSeparator: \.isNewline)
    }

    /// Parses a multi-line string.
    /// - Parameters:
    ///   - string: A string to parse.
    ///   - type: A type to use for parsing
    ///   - callback: A callback to use when the value is available. If the value is not parseable or is empty, the value returned is `nil`.
    static func parse<T: ParseStrategy>(_ string: String, _ parseStrategy: T, callback: (T.ParseOutput?) -> Void) where T.ParseInput == String {
        let lines = values(string)
        lines.forEach { line in

            do {
                let value = try parseStrategy.parse(String(line))
                logger.info("Parsed Line: \(line)")
                callback(value)
            } catch {
                logger.error("Error while parsing: \(error)")
                callback(nil)
            }
        }
    }

    static func map<T: ParseStrategy>(_ string: String, _ parseStrategy: T) -> [T.ParseOutput?] where T.ParseInput == String {
        let lines = values(string)
        return lines.map { line in
            do {
                let value = try parseStrategy.parse(String(line))
                logger.info("Parsed Line: \(line)")
                return value
            } catch {
                logger.error("Error while parsing: \(error)")
                return nil
            }
        }
    }
}
