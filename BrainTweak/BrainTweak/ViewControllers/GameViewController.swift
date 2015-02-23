//
//  GameViewController.swift
//  BrainTweak
//
//  Created by Adam Ahrens on 2/20/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var incorrectButton: UIButton!
    @IBOutlet weak var tableViewBottomSpace: NSLayoutConstraint!
    
    var gameBrain: GameBrain?
    var scoreKeeper: ScoreKeeper?
    var currentMathProblem = 0
    var answeredQuestions = Dictionary<Int, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Game"
        
        // Setup the ScoreKeeper
        scoreKeeper = ScoreKeeper(maxScore: Double(gameBrain!.size()))
    }
    
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameBrain!.size()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MathCell", forIndexPath: indexPath) as MathCell
        cell.mathProblem.text = gameBrain!.mathProblemDisplay(indexPath.row)
        
        if (answeredQuestions[indexPath.row] != nil) {
            if (answeredQuestions[indexPath.row] == "true") {
                let greenColor = UIColor(red: 4.0/255.0, green: 175.0/255.0, blue: 77.0/255.0, alpha: 1.0)
                cell.backgroundColor = greenColor
                cell.contentView.backgroundColor = greenColor
                cell.mathProblem.backgroundColor = greenColor
            } else {
                let redColor = UIColor(red: 255.0/255.0, green: 61.0/255.0, blue: 50.0/255.0, alpha: 1.0)
                cell.backgroundColor = redColor
                cell.contentView.backgroundColor = redColor
                cell.mathProblem.backgroundColor = redColor
            }
        }

        return cell
    }
    
    //MARK: IBActions
    @IBAction func wrongPressed(sender: UIButton) {
        userAnsweredQuestionWith(false)
    }
    
    @IBAction func submitPressed(sender: UIButton) {
        userAnsweredQuestionWith(true)
    }
    
    private func userAnsweredQuestionWith(answer: Bool) {
        var usersAnswerIsCorrect = "false"
        if gameBrain!.isMathProblemCorrect(currentMathProblem) == answer {
            scoreKeeper!.answeredCorrectly()
            usersAnswerIsCorrect = "true"
        }
        
        answeredQuestions[currentMathProblem] = usersAnswerIsCorrect
        currentMathProblem++
        if currentMathProblem == gameBrain!.size() {
            disableButtons()
        }
        
        tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: currentMathProblem - 1, inSection: 0)], withRowAnimation: .Automatic)
    }
    
    private func disableButtons() {
        correctButton.enabled = false
        incorrectButton.enabled = false
        
        UIView.animateWithDuration(0.35, animations: {
            self.tableViewBottomSpace.constant = 0
            correctButton.hidden = true
            incorrectButton.hidden = true
            self.view.layoutIfNeeded()
        })
    }
}
