//
//  ASChoicesRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-04-27.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASChoicesRow: ASRow, ChoicesDelegate {
    var multiChoices: [String] = []
    var multiplierChoices: [Int] = []
    var modifyingRule: ASRule
    
    init(title: String, withChoices choices: [String], multiplierChoices: [Int], modifyingRule: ASRule) {
        self.modifyingRule = modifyingRule
        super.init(title: title)
        multiChoices = choices
        self.multiplierChoices = multiplierChoices
    }

    func choicesView(changedChoiceToIndex choiceIndex: Int) {
        if let rule = modifyingRule as? ASInputRule {
            rule.pointsPer = multiplierChoices[choiceIndex]
            rule.setPoints()
        }
    }
}
