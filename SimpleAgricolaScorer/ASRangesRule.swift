//
//  ASRangesRule.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-05-31.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASRangesRule: ASTranslateRule {
    var ranges: [(Int, Int)]
    
    init(pointRanges: [(Int, Int)]) {
        self.ranges = pointRanges
        super.init(translate: [-1, 1, 2, 3, 4])
    }
    
    override func setPointsByIndex(index: Int) {
        for i in 0...(ranges.count - 1) {
            if value(index, isInRange: ranges[i]) {
                super.setPointsByIndex(i);
                return;
            }
        }
    }
    
    //range.0 = -1 means any value less than range.1 -- range.1 = -1 means any value greater than range.0 for example (4, -1) means 4+
    private func value(value: Int, isInRange range: (Int, Int)) -> Bool {//value = 5 && range(4, -1)
        return !(range.0 < -1 || range.1 < -1) && !(range.0 == -1 && range.1 == -1) && range.0 == -1 ? true : value >= range.0 && range.1 == -1 ? true : value <= range.1
    }
}
