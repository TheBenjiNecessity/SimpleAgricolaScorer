//
//  ASTranslateRule.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-07-31.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASTranslateRule: ASRule {
   var pointTranslate: [Int] = []
    
    init(translate: [Int]) {
        self.pointTranslate = translate
        super.init()
    }
    
    override func setPointsByIndex(index: Int) {
        points = pointTranslate[index]
    }
}
