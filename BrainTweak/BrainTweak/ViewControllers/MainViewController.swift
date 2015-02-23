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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "GameSegue" {
            let gameViewController = segue.destinationViewController as GameViewController
            gameViewController.gameBrain = GameBrain(difficulty: .Easy, numberOfProblems: self.numberOfQuestions[numberOfQuestionsPicker.selectedRowInComponent(0)])
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
