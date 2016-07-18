//
//  ASInputRule.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-08-03.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASInputRule : ASRule {
    var pointsPer: Int
    
    init(per: Int) {
        self.pointsPer = per
        super.init()
    }
    
    override func pointsByAmount(amount: Int) -> Int {
        return pointsPer * amount
    }
}
