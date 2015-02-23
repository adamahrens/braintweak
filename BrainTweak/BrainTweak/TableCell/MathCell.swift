//
//  MathCell.swift
//  BrainTweak
//
//  Created by Adam Ahrens on 2/22/15.
//  Copyright (c) 2015 Appsbyahrens. All rights reserved.
//

import UIKit

class MathCell: UITableViewCell {
    @IBOutlet weak var mathProblem: UILabel!
    
    override func prepareForReuse() {
        self.backgroundColor = UIColor.whiteColor()
        self.contentView.backgroundColor = UIColor.whiteColor()
        mathProblem.backgroundColor = UIColor.whiteColor()
    }
}
