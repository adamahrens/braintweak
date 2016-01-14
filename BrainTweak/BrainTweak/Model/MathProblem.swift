//
//  MathProblem.swift
//  BrainTweak
//
//  Created by Adam Ahrens on 2/20/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import Foundation

enum Operator: CustomStringConvertible {
    case Plus, Subtract, Divide, Multiply
    
    var description: String {
        switch self {
            case .Plus : return "+"
            case .Subtract : return "-"
            case .Divide : return "÷"
            case .Multiply : return "×"
        }
    }
}

class MathProblem {
    // ivars
    private let firstOperand: Int
    private let secondOperand: Int
    private let operation: Operator
    
    init(first: Int, second: Int, operation: Operator) {
        firstOperand = first
        secondOperand = second
        self.operation = operation
    }
    
    // Displays a math problem correctly
    // e.g. 1 + 2 = 3
    func correctDisplay() -> String {
        return displayResult(true)
    }
    
    // Displays a math problem incorrectly
    // e.g. 1 + 2 = 6
    func incorrectDisplay() -> String {
        return displayResult(false)
    }
    
    private func displayResult(wantAccurateResult: Bool) -> String {
        return "\(firstOperand) \(operation.description) \(secondOperand) = \(computeTheResult(wantAccurateResult))"
    }
    
    // Takes the two operands and performs the operation
    // Can decide if we want the result of the operation
    // To be accurate or not
    private func computeTheResult(wantAccurateResult: Bool) -> String {
        var result = 0;
        switch operation {
            case .Plus : result = performOperation({$0 + $1})
            case .Subtract : result = performOperation({$0 - $1})
            case .Divide : result = performOperation({$0 / $1})
            case .Multiply : result = performOperation({$0 * $1})
        }
        
        if !wantAccurateResult {
            // Create a random result
            let range = [firstOperand, secondOperand, result].reduce(Int.min, combine: { max($0, $1) })
            let ranges = (1...range).map({$0}).filter({$0 != result})
            ranges.shuffle()
            result = ranges.first!
        }
        
        return "\(result)"
    }
    
    // Takes a function that takes two ints and returns the result 
    // of running that operation
    private func performOperation(operation:(Int, Int) -> Int) -> Int{
        return operation(firstOperand, secondOperand)
    }
}
