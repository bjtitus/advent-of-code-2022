//
//  File.swift
//  
//
//  Created by Brandon Titus on 12/4/22.
//

import Foundation

struct GroupAssignmentsParseStrategy: ParseStrategy {
    typealias ParseInput = String
    typealias ParseOutput = (ClosedRange<Int>, ClosedRange<Int>)

    enum GroupAssignmentParseError: Error {
        case empty
        case tooFewComponents(Int)
        case wrongComponentTypes(Substring, Substring)
    }

    func parse(_ value: String) throws -> ParseOutput {
        guard value.isEmpty == false else {
            throw GroupAssignmentParseError.empty
        }
        
        let substrings = value.split(separator: ",")
        let ranges = try substrings.map({ string in
            let components = string.split(separator: "-")

            guard components.count == 2 else {
                throw GroupAssignmentParseError.tooFewComponents(components.count)
            }


            guard let first = Int(components[0]),
                  let second = Int(components[1]) else {
                throw GroupAssignmentParseError.wrongComponentTypes(components[0], components[1])
            }

            return first...second
        })

        return (ranges[0], ranges[1])
    }
}
