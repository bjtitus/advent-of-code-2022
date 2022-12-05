import XCTest
@testable import AOC22

final class Day3_test: AOCTestCase {
    enum File: String {
        case example = "day3-example"
        case input = "day3-input"
    }

    func testDay3Part1Example() {
        let string = readFile(File.example.rawValue)

        let score = AOC22.Day3.compartmentsPrioritySum(string)
        XCTAssertEqual(score, 157, "Total should equal 157")
    }

    func testDay3Part1() {
        let string = readFile(File.input.rawValue)

        let score = AOC22.Day3.compartmentsPrioritySum(string)
        XCTAssertEqual(score, 7785, "Total should equal 7785")
    }

    func testDay3Part2Example() {
        let string = readFile(File.example.rawValue)

        let score = AOC22.Day3.badgePrioritySum(string)
        XCTAssertEqual(score, 70, "Total should equal 70")
    }

    func testDay3Part2() {
        let string = readFile(File.input.rawValue)

        let score = AOC22.Day3.badgePrioritySum(string)
        XCTAssertEqual(score, 2633, "Total should equal 2633")
    }
}
