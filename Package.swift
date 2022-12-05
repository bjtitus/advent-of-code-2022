// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AOC22",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AOC22",
            targets: ["AOC22"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-algorithms.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AOC22",
            dependencies: [.product(name: "Algorithms", package: "swift-algorithms")]
        ),
        .testTarget(
            name: "AOC22Tests",
            dependencies: ["AOC22"],
            resources: [
                .process("Day4/day4-example.txt"),
                .process("Day4/day4-input.txt"),
                .process("Day3/day3-example.txt"),
                .process("Day3/day3-input.txt"),
                .process("Day2/day2-example.txt"),
                .process("Day2/day2-input.txt"),
                .process("Day1/day1-example.txt"),
                .process("Day1/day1-input.txt"),
            ]),
    ]
)
