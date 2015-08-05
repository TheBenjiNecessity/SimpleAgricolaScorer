//
//  ASLimitResultRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-05-07.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASLimitResultRow: ASRow, LimitPickerDelegate {
    var upperLimit: Int = -1
    
    init(title: String, withLimit limit: Int, pointsRule: ASRule) {
        upperLimit = limit
        super.init(title: title, pointsRule: pointsRule)
    }
    
    func limitPickerView(limitPicker: UIPickerView, didSelectRow row: Int) {
        value = limitPicker.selectedRowInComponent(0)
        rule!.setPointsByIndex(row)
    }
}
