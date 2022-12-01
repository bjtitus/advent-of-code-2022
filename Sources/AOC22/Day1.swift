import os

public struct Day1 {
    static let logger = Logger(subsystem: "io.titus.aoc22", category: "Day1")

    static func parse(_ string: String) -> [Elf] {
        var elves: [Elf] = [Elf(position: 1)]
        var currentElf: Elf? {
            get {
                return elves.last
            }
            set {
                if let newValue, let index = elves.indices.last {
                    elves[index] = newValue
                }
            }
        }
        
        StringParser.read(string, Int.self) { calories in
            if let calories {
                // Add to existing Elf
                let food = Food(calories: calories)
                currentElf?.food.append(food)
                logger.info("Added Calories: \(calories, privacy: .public) to: \(currentElf, privacy: .public)")
            } else {
                logger.info("Saved Elf: \(currentElf, privacy: .public)")
                // Create new Elf
                let newPosition = currentElf?.position ?? 0 + 1
                elves.append(Elf(position: newPosition))
                logger.info("New Elf: \(currentElf, privacy: .public)")
            }
        }
       
        return elves
    }

    public static func maxCalories(_ string: String) -> Int? {
        let elves = parse(string)
        return elves.map(\.calories).max()
    }
    
    public static func maxCalories(_ string: String, top: Int) -> [Int] {
        let elves = parse(string)
        let sortedElves = elves.sorted(by: { $0.calories > $1.calories })
        return sortedElves.prefix(top).map(\.calories)
    }
}

