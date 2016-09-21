//
//  ASLimitResultRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-05-07.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASLimitResultRow: ASResultRow, LimitPickerDelegate {
    var upperLimit = -1
    var lowerLimit = 0
    var multiplier = 1
    
    init(title: String, withUpperLimit upperLimit: Int, pointsRule: ASRule, row: ASResultRowExtender) {
        self.upperLimit = upperLimit
        super.init(title: title, pointsRule: pointsRule, row: row)
    }
    
    init(title: String, withUpperLimit upperLimit: Int, lowerLimit: Int, pointsRule: ASRule, row: ASResultRowExtender) {
        self.upperLimit = upperLimit
        self.lowerLimit = lowerLimit
        super.init(title: title, pointsRule: pointsRule, row: row)
    }
    
    func limitPickerView(limitPicker: UIPickerView, didSelectRow row: Int) {
        let amount = limitPicker.selectedRowInComponent(0)
        rule?.amount = amount
        value = amount
    }
}
