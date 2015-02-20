//
//  MathProblem.swift
//  BrainTweak
//
//  Created by Adam Ahrens on 2/20/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import Foundation

enum Operator: Printable {
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
    // Default values
    let firstOperand: Int = 1
    let secondOperand: Int = 2
    let operation = Operator.Plus
    
    init(first: Int, second: Int, operation: Operator) {
        firstOperand = first
        secondOperand = second
        self.operation = operation
    }
    
    func correctDisplay() -> String {
        return "\(firstOperand) \(operation.description) \(secondOperand) = \(computeTheResult())"
    }
    
    func computeTheResult() -> String {
        var result = 0;
        switch operation {
            case .Plus : result = performOperation({$0 + $1})
            case .Subtract : result = performOperation({$0 - $1})
            case .Divide : result = performOperation({$0 / $1})
            case .Multiply : result = performOperation({$0 * $1})
        }
        
        return "\(result)"
    }
    
    // Takes a function that takes two ints and returns the result 
    // of running that operation
    private func performOperation(operation:(Int, Int) -> Int) -> Int{
        return operation(firstOperand, secondOperand)
    }
}