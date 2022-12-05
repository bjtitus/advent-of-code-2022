extension Collection {

    /// The `Index` of the middle position of this collection.
    var middleIndex: Index {
        let midPoint = indices.count / 2
        return index(startIndex, offsetBy: midPoint)
    }

    /// Splits the collection into a series of SubSequences based given a set of `indices`.
    /// - Parameter indices: A collection of `Index` values. These must be in order!
    /// - Returns: A collection of `SubSequence` values containing the ranges represetned by `indices`.
    func split(indices: Index...) -> [SubSequence] {

        let iterableIndices = indices + [endIndex]
        var currentIndex = startIndex
        var collection = [SubSequence]()

        iterableIndices.forEach { index in
            collection.append(self[currentIndex..<index])
            currentIndex = index
        }

        return collection
    }
}
