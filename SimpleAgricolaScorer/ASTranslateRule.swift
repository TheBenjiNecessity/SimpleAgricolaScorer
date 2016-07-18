//
//  ASTranslateRule.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-07-31.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASTranslateRule: ASRule {
   var pointTranslate: [Int]? = nil
    
    init(translate: [Int]?) {
        if translate == nil {
            pointTranslate = [-1, 1, 2, 3, 4]
        } else {
            pointTranslate = translate
        }
        
        super.init()
    }
    
    override func pointsByAmount(amount: Int) -> Int {
        if let translate = pointTranslate {
            return translate[amount]
        }
        return -1
    }
}
