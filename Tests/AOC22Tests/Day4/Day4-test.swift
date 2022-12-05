//
//  Day4-test.swift
//  
//
//  Created by Brandon Titus on 12/4/22.
//

import XCTest
@testable import AOC22

final class Day4_test: AOCTestCase {
    enum File: String {
        case example = "day4-example"
        case input = "day4-input"
    }

    func testOverlaps() {
        let noOverlap = AOC22.Day4.eitherFullyContain(first: 1...2, second: 3...4)
        XCTAssertFalse(noOverlap)

        let overlapNotContained = AOC22.Day4.eitherFullyContain(first: 1...3, second: 3...4)
        XCTAssertFalse(overlapNotContained)

        let contained = AOC22.Day4.eitherFullyContain(first: 1...4, second: 3...4)
        XCTAssertTrue(contained)
    }

    func testDay4Part1Example() {
        let string = readFile(File.example.rawValue)

        let score = AOC22.Day4.fullyContained(string)
        XCTAssertEqual(score, 2, "There should be 2 contained sections")
    }

    func testDay4Part1() {
        let string = readFile(File.input.rawValue)

        let score = AOC22.Day4.fullyContained(string)
        XCTAssertEqual(score, 576, "There should be 576 contained sections")
    }

    func testDay4Part2Example() {
        let string = readFile(File.example.rawValue)

        let score = AOC22.Day4.overlaps(string)
        XCTAssertEqual(score, 4, "There should be 4 overlapping sections")
    }

    func testDay4Part2() {
        let string = readFile(File.input.rawValue)

        let score = AOC22.Day4.overlaps(string)
        XCTAssertEqual(score, 905, "There should be 905 overlapping sections")
    }
}
