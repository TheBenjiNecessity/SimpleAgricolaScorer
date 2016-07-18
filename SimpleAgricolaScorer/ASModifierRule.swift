//
//  ASModifierRule.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-08-03.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASModifierRule: ASRule {
    var modifyingRule: ASRule
    
    init(rule: ASRule) {
        modifyingRule = rule
        super.init()
    }

}
