//
//  ArrayExtension.swift
//  BrainTweak
//
//  Created by Adam Ahrens on 2/20/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import Foundation

extension Array {
    mutating func shuffle() {
        for index in 0..<(count - 1) {
            let randomIndex = Int(arc4random_uniform(UInt32(count - index))) + index
            swap(&self[index], &self[randomIndex])
        }
    }
}