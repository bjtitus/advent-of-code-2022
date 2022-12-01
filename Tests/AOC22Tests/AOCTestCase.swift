import XCTest

class AOCTestCase: XCTestCase {
    func readFile(_ string: String) -> String {
        guard let dataURL = Bundle.module.url(forResource: string, withExtension: "txt") else {
            XCTFail("Could not find \(string).txt file")
            return ""
        }

        do {
            return try String(contentsOf: dataURL, encoding: .utf8)
        } catch {
            XCTFail("Failed reading string from \(dataURL): \(error)")
            return ""
        }
    }
}
