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
    
    override func viewDidLoad() {
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
        return cell
    }
    
    //MARK: IBActions
    @IBAction func wrongPressed(sender: UIButton) {
        if !gameBrain!.isMathProblemCorrect(currentMathProblem) {
            scoreKeeper!.answeredCorrectly()
        }
        
        currentMathProblem++
        
        if currentMathProblem == gameBrain!.size() {
            disableButtons()
        }
    }
    
    @IBAction func submitPressed(sender: UIButton) {
        if gameBrain!.isMathProblemCorrect(currentMathProblem) {
            scoreKeeper!.answeredCorrectly()
        }
        
        currentMathProblem++
        
        if currentMathProblem == gameBrain!.size() {
            disableButtons()
        }
    }
    
    private func disableButtons() {
        correctButton.enabled = false
        incorrectButton.enabled = false
        
        UIView.animateWithDuration(0.35, animations: {
            self.tableViewBottomSpace.constant = 0
            self.view.layoutIfNeeded()
        })
    }
}
