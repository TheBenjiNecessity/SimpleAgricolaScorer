//
//  ASRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-04-27.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASRow: NSObject {
    var displayTitle: String
    var value: Int = 0
    var rule: ASRule? = nil
    
    init(title: String) {
        displayTitle = title
    }
    
    init(title: String, pointsRule: ASRule) {
        rule = pointsRule
        displayTitle = title
    }
}
