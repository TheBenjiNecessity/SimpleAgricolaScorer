//
//  ASChoicesRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-04-27.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

protocol ChoicesDelegate {
    func choicesView(changedChoiceToIndex choiceIndex: Int)
}

class ASChoicesRow: ASRow {
    var choice: String = ""
    var multiChoices: [String] = []
    var delegate: ChoicesDelegate?
    
    init(title: String, withChoices choices: [String], modifierRule: ASModifierRule) {
        super.init(title: title)
        multiChoices = choices
        rule = modifierRule
    }

    func choiceChanged(index: Int) {
        delegate?.choicesView(changedChoiceToIndex: index)
    }
}
