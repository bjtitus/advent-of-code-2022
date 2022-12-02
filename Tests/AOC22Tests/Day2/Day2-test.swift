import XCTest
@testable import AOC22

final class Day2_test: AOCTestCase {

    enum File: String {
        case example = "day2-example"
        case input = "day2-input"
    }

    func testDay2Part1Example() {
        let string = readFile(File.example.rawValue)

        let score = AOC22.Day2.score(string)
        XCTAssertEqual(score, 15, "Score should equal 15")
    }

    func testDay2Part1() {
        let string = readFile(File.input.rawValue)

        let score = AOC22.Day2.score(string)
        XCTAssertEqual(score, 14297, "Score should equal 14297")
    }

    func testDay2Part2() {
        let string = readFile(File.input.rawValue)

        let score = AOC22.Day2.scorePart2(string)
        XCTAssertEqual(score, 10498, "Score should equal 10498")
    }

}
