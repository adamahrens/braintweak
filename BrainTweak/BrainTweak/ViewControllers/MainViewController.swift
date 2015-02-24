//
//  MainViewController.swift
//  BrainTweak
//
//  Created by Adam Ahrens on 2/20/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import UIKit

//MARK: MainViewController
class MainViewController: UITableViewController {
    
    @IBOutlet weak var numberOfQuestionsPicker: UIPickerView!
    @IBOutlet weak var easyLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var difficultLabel: UILabel!
    
    var difficultyLabels : [UILabel] {
        get {
            return [easyLabel, mediumLabel, difficultLabel]
        }
    }
    
    var selectedDifficulty: Difficulty = .Easy
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "GameSegue" {
            let gameViewController = segue.destinationViewController as GameViewController
            gameViewController.gameBrain = GameBrain(difficulty: selectedDifficulty, numberOfProblems: self.numberOfQuestions[numberOfQuestionsPicker.selectedRowInComponent(0)])
        }
    }
    
    @IBAction func tappedDifficulty(sender: UITapGestureRecognizer) {
        // Only allow one difficulty to be selected
        for label in difficultyLabels {
            if label == sender.view {
                label.textColor = UIColor.whiteColor()
                label.backgroundColor = UIColor(red: 229.0/255.0, green: 88.0/255.0, blue: 145.0/255.0, alpha: 1)
                if sender.view == easyLabel {
                    selectedDifficulty = .Easy
                } else if sender.view == mediumLabel {
                    selectedDifficulty = .Medium
                } else {
                    selectedDifficulty = .Hard
                }
            } else {
                label.textColor = UIColor.blackColor()
                label.backgroundColor = UIColor.whiteColor()
            }
        }
    }
}

//MARK: UIPickerView Extension
extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    var numberOfQuestions : [Int] {
        get {
            return [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 100, 200]
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfQuestions.count
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: "\(numberOfQuestions[row])")
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
}
