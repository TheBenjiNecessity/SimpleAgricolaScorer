//
//  MultiChoiceTableViewCell.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-04-29.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

protocol ChoicesDelegate {
    func choicesView(changedChoiceToIndex choiceIndex: Int)
}

class MultiChoiceTableViewCell: UITableViewCell {
    var delegate: ChoicesDelegate?
    
    @IBOutlet var multiSelect: UISegmentedControl!
    @IBOutlet var displayTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func choiceChanged(sender: AnyObject) {
        let segmentedControl: UISegmentedControl = (sender as! UISegmentedControl)
        delegate?.choicesView(changedChoiceToIndex: segmentedControl.selectedSegmentIndex)
    }
}
