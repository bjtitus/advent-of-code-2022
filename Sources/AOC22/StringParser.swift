struct StringParser {
    static func read<T: LosslessStringConvertible>(_ string: String, _ type: T.Type, callback: (T?) -> Void) {
        let lines = string.split(omittingEmptySubsequences: false, whereSeparator: \.isNewline)
        lines.forEach { line in
            let characters = line.filter {
                type.init(String($0)) != nil
            }

            if let value = type.init(characters), characters.isEmpty == false {
                callback(value)
            } else {
                callback(nil)
            }
        }
    }
}
