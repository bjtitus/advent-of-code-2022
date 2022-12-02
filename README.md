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
