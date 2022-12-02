struct Elf {
    let position: Int
    var food: [Food] = []
    var calories: Int {
        return food.reduce(0) { sum, value in
            return sum + value.calories
        }
    }
}

struct Food {
    let calories: Int
}
