//
//  ScoreKeeper.swift
//  BrainTweak
//
//  Created by Adam Ahrens on 2/20/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import Foundation

class ScoreKeeper {
    // Max score
    let maxScore: Double
    
    // How many answered correctly
    var correctlyAnswered = 0.0
    
    init(maxScore: Double) {
        assert(maxScore >= 1.0, "Have to have number greater than or equal to 1")
        self.maxScore = maxScore
    }
    
    // Increase the total number of correctly answered problems
    func answeredCorrectly() {
        correctlyAnswered += 1.0
    }
    
    // Score
    func score() -> Double {
        return correctlyAnswered / maxScore
    }
}