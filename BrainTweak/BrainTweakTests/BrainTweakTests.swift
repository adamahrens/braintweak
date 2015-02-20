//
//  BrainTweakTests.swift
//  BrainTweakTests
//
//  Created by Adam Ahrens on 2/20/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import UIKit
import XCTest

class BrainTweakTests: XCTestCase {
    
    func testAdditionMathProblemCorrectDisplay() {
        let addition = MathProblem(first: 1, second: 2, operation: .Plus)
        XCTAssertEqual("1 + 2 = 3", addition.correctDisplay(), "Should have the correct display")
        
        let anotherAddition = MathProblem(first: 9, second: 2, operation: .Plus)
        XCTAssertEqual("9 + 2 = 11", anotherAddition.correctDisplay(), "Should have the correct display")
    }
    
    func testSubtractionMathProblemCorrectDisplay() {
        let subtraction = MathProblem(first: 9, second: 5, operation: .Subtract)
        XCTAssertEqual("9 - 5 = 4", subtraction.correctDisplay(), "Should have the correct display")
        
        let anotherSubtraction = MathProblem(first: 3, second: 3, operation: .Subtract)
        XCTAssertEqual("3 - 3 = 0", anotherSubtraction.correctDisplay(), "Should have the correct display")
    }
    
    func testMultiplicationMathProblemCorrectDisplay() {
        let multiplication = MathProblem(first: 1, second: 2, operation: .Multiply)
        XCTAssertEqual("1 × 2 = 2", multiplication.correctDisplay(), "Should have the correct display")
        
        let anotherMultiplication = MathProblem(first: 3, second: 3, operation: .Multiply)
        XCTAssertEqual("3 × 3 = 9", anotherMultiplication.correctDisplay(), "Should have the correct display")
    }
    
    func testDivisionMathProblemCorrectDisplay() {
        let division = MathProblem(first: 10, second: 5, operation: .Divide)
        XCTAssertEqual("10 ÷ 5 = 2", division.correctDisplay(), "Should have the correct display")
        
        let anotherDivision = MathProblem(first: 8, second: 2, operation: .Divide)
        XCTAssertEqual("8 ÷ 2 = 4", anotherDivision.correctDisplay(), "Should have the correct display")
        
        let oneMoreDivision = MathProblem(first: 11, second: 1, operation: .Divide)
        XCTAssertEqual("11 ÷ 1 = 11", oneMoreDivision.correctDisplay(), "Should have the correct display")
    }
    
}
