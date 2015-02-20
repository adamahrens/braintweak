//
//  GameBrain.swift
//  BrainTweak
//
//  Created by Adam Ahrens on 2/20/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import Foundation

enum Difficulty {
    case Easy, Medium, Hard
}

class GameBrain {
    let mathProblems: [MathProblem]
    let mathProblemResults: [String]
    
    // Create a game of difficulty and number of problems
    // TODO: Need to utilize the difficulty parameter
    init(difficulty: Difficulty, numberOfProblems: Int) {
        var problems = [MathProblem]()
        for _ in 1...numberOfProblems {
            // Get two numbers between 1 and 10 (exclusive)
            let first = Int(arc4random_uniform(9) + 1)
            let second = Int(arc4random_uniform(9) + 1)
            let problem = MathProblem(first: first, second: second, operation: .Plus)
            problems.append(problem)
        }
        
        mathProblems = problems
        
        // Now construct the array of the displayed MathProblems
        // These will be a random assortment of showing
        // The correct and incorrect versions
        var problemResults = [String]()
        for mathProblem in mathProblems {
            let random = Int(arc4random_uniform(2))
            problemResults.append(random == 1 ? mathProblem.correctDisplay() : mathProblem.incorrectDisplay())
        }
        
        mathProblemResults = problemResults
    }
    
    func size() -> Int {
        return mathProblems.count
    }
    
    func mathProblemDisplay(index: Int) -> String {
        assert(index > -1 && index < mathProblems.count, "Index out of bounds")
        return mathProblemResults[index]
    }
    
    func isMathProblemCorrect(index: Int) -> Bool {
        assert(index > -1 && index < mathProblems.count, "Index out of bounds")
        return mathProblemResults[index] == mathProblems[index].correctDisplay()
    }
}