//
//  MultiChoiceTableViewCell.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-04-29.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class MultiChoiceTableViewCell: UITableViewCell {
    var row: ASChoicesRow? = nil
    
    @IBOutlet var multiSelect: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func choiceChanged(sender: AnyObject) {
        var segmentedControl: UISegmentedControl = (sender as! UISegmentedControl)
        
        row?.choice = segmentedControl.titleForSegmentAtIndex(segmentedControl.selectedSegmentIndex)!
    }
}
