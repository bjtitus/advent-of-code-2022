extension Elf: CustomStringConvertible {
    var description: String {
        return "Elf[position: \(position), food: \(food), calories: \(calories)]"
    }
}

extension Optional<Elf>: CustomStringConvertible {
    public var description: String {
        return self?.description ?? "No Elf"
    }
}
