import XCTest
@testable import AOC22

class TestDay1: XCTestCase {
    func readFile(_ string: String) -> String {
        guard let dataURL = Bundle.module.url(forResource: string, withExtension: "txt") else {
            XCTFail("Could not find day1-part1.txt file")
            return ""
        }

        do {
            return try String(contentsOf: dataURL, encoding: .utf8)   
        } catch {
            XCTFail("Failed reading string from \(dataURL): \(error)")
            return ""
        }
    }

    func testDay1Part1Example() {
        let string = readFile("day1-example")

        do {
            let calories = try XCTUnwrap(AOC22.Day1.maxCalories(string))
        
            XCTAssertEqual(calories, 24000, "Maximum calories should equal 24000")        
        } catch {
            XCTFail("Failed to unwrap calories")
        }
    }

    func testDay1Part1() {
        let string = readFile("day1")

        do {
            let calories = try XCTUnwrap(AOC22.Day1.maxCalories(string))
        
            XCTAssertEqual(calories, 71780, "Maximum calories should equal 71780")
        } catch {
            XCTFail("Failed to unwrap calories")
        }
    }
    
    func testDay1Part2() {
        let string = readFile("day1")

        do {
            let calories = try XCTUnwrap(AOC22.Day1.maxCalories(string, top: 3))
        
            XCTAssertEqual(calories, [71780, 71481, 69228], "Top 3 maximum calories is wrong")
            let sum = calories.reduce(0, +)
            XCTAssertEqual(sum, 212489, "Top 3 sum should equal")
        } catch {
            XCTFail("Failed to unwrap calories")
        }
    }
}
