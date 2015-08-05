//
//  ASChoiceRule.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-08-03.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASChoiceRule: ASTranslateRule, ChoicesDelegate {
    var row: ASChoicesRow;
    
    init(choicesRow: ASChoicesRow, translate: [Int]) {
        self.row = choicesRow
        super.init(translate: translate);
        self.row.delegate = self
    }
    
    func choicesView(changedChoiceToIndex choiceIndex: Int) {
        setPointsByIndex(choiceIndex);
    }
}
