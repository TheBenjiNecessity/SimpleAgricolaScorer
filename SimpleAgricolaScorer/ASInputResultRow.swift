//
//  ASInputResultRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-05-25.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASInputResultRow: ASRow, NumberPickerDelegate {
    init(displayTitle: String) {
        super.init(title: displayTitle)
    }
    
    func numberPickerView(numberPicker: UITextField, numberWasTyped number: Int) {
        value = number
    }
}
