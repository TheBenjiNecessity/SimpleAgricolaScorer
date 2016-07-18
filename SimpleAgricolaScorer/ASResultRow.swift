//
//  ASResultRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-11-09.
//  Copyright © 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASResultRow: ASRow {
    var result: Int = 0
    var extender: ASResultRowExtender
    
    init(title: String, row: ASResultRowExtender) {
        extender = row
        super.init(title: title)
        shouldSelect = true
    }
    
    init(title: String, pointsRule: ASRule, row: ASResultRowExtender) {
        extender = row
        super.init(title: title, pointsRule: pointsRule)
        shouldSelect = true
    }
}
