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
    
    init(pointRanges: [(Int, Int)], translate: [Int]?) {
        ranges = pointRanges
        super.init(translate: translate)
        if !rangesPassRequirements(ranges) {
            fatalError("(Init Error) Ranges does not pass requirements")
        } else if pointRanges.count == translate?.count {
            fatalError("(Init Error) Length of translate doesn't equal length of ranges")
        }
    }
    
    func rangesPassRequirements(ranges: [(Int, Int)]) -> Bool {//what about the tuple at the end with -1 meaning infinity?
        var previousRightValue = -1
        
        for i in 0...(ranges.count - 1) {
            let range = ranges[i]
            let lastRange = i == ranges.count - 1
            
            if range.0 < 0 {
                return false
            } else if !lastRange && (range.1 < 0 || range.0 > range.1) {
                return false
            } else if lastRange && range.1 != -1 && range.0 > range.1 {
                return false
            } else if i != 0 && previousRightValue != range.0 - 1 {
                return false
            }
            
            previousRightValue = range.1
        }
        return true
    }
    
    //range.0 = -1 means any value less than range.1 -- range.1 = -1 means any value greater than range.0 for example (4, -1) means 4+
    private func value(value: Int, isInRange range: (Int, Int)) -> Bool {//value = 5 && range(4, -1)
        return !(range.0 < -1 || range.1 < -1)
            && !(range.0 == -1 && range.1 == -1)
            && range.0 == -1 ? true
            : value >= range.0 && range.1 == -1 ? true
            : value <= range.1
    }
    
    override func pointsByAmount(amount: Int) -> Int {
        for i in 0...(ranges.count - 1) {
            if value(amount, isInRange: ranges[i]) {
                return super.pointsByAmount(i)
            }
        }
        
        return -1
    }
}
