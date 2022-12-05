# Advent of Code 2022

A package containing my Swift solutions for [Advent of Code 2022](https://adventofcode.com/2022).

I've gone several weeks into Advent of Code before and often see a lot of the same paradigms pop up:
* Line by line string parsing
* Collecting & counting values given certain formats

This year, I'm focused on creating reusable components to help me across each day of the challenge. Instead of copying and pasting the same set of for loops & file parsing code, I'll abstract those parts away and try to create types which handle each line parsing.

I may go back to previous days' solutions as I update APIs, so unit tests for each day will ensure nothing breaks.

I'll also be experimenting with OSLog a bit with custom formatters and other useful tools. Perhaps some custom Instruments will come along for the ride!

### Day 1

* `StringParser` contains the logic for iterating over the lines in a string and verifying that a type `T` conforming to `LosslessStringConvertible` can be created from each line.
* `Elf` model to contain the logic for calorie counting. them
* `maxCalories` computed the part 1 solution
* `maxCalories(_:top:)` computed the part 2 solution.

#### TIL

* [`split(whereSeparator: \.isNewline)`](https://developer.apple.com/documentation/createmlcomponents/classificationdistribution/split(maxsplits:omittingemptysubsequences:whereseparator:)#)) is a handy function for splitting using the handy [Character](https://developer.apple.com/documentation/swift/character) properties from "Inspecting a Character".
* `split(omittingEmptySubsequences: false...)` will keep the empty subsequences around. Otherwise, they are thrown out of the resulting collection. 
* [`LosslessStringConvertible`](https://developer.apple.com/documentation/swift/losslessstringconvertible#) is a handy protocol for getting types which can be initialized by a string.


### Day 2

* Converted `StringParser` to use `ParseStrategy` instead of `LosslessStringConvertible`. Not sure that it's any better but I was interested in the flexible way to specify a format in the `IntegerParseStrategy` and curious about the API. 🤷‍♂️
* Added a `map` function so the completion block thing isn't needed.
* `Roshambo` to represent the moves with associated scores and logic to convert between them. A lot of case statements which might be simplified a bit.
* `RoshamboParseStrategy` to parse the lines in Part 1.
* `RoshamboResultParseStrategy` to parse the lines in Part 2. 

#### TIL

* [`ParseStrategy`](https://developer.apple.com/documentation/foundation/parsestrategy#). Probably a little overkill for most of these solutions, but it's a nice API for converting a `ParseInput` to a `ParseOutput` and adjust with new formatting options.
* `value.split(whereSeparator: \.isWhitespace)` could be replaced by `value.split(separator: .whitespace)` with new [`CharacterClass.whitespace`](https://developer.apple.com/documentation/regexbuilder/characterclass/whitespace#), part of `RegexBuilder`

### Day 3

* Added a `Collection.split(indices:)` function to split a function at the points specified by the provided indices. 
* Added a `Collection.middleIndex` property to calculate the middle index of a collection.
* I initially wrote my own little chunking function but decided to use Swift algorithms' instead. I think it will probably come in handy later on in the challenges. 🤞
* The `RucksackCompartmentsParseStrategy` uses the `Collection.split` function along with the `middleIndex` to split each compartment.

#### TIL
* Dealing with Strings, Characters, and Unicode values is still a pain.
* I wish there was a _good_ way to iterate over `CharacterSet` but I suppose that would make it something more than it is.
* Learned a bit the `UnicodeScalar` and `UnicodeScalarView`
