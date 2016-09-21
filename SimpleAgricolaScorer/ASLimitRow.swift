//
//  ASLimitRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-04-27.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASLimitRow: ASResultRowExtender {
    var upperLimit: Int = -1
    var lowerLimit: Int = 0
    
    init(limit: Int) {
        super.init(title: "")
        self.upperLimit = limit
        height = 162.0;
    }
    
    init(limit: Int, lowerLimit: Int) {
        super.init(title: "")
        self.upperLimit = limit
        self.lowerLimit = lowerLimit
        height = 162.0;
    }
}
