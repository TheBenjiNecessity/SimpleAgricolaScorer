//
//  ASRule.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-05-30.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASRule: NSObject {
    private var _amount = 0
    var points: Int = -1
    var amount: Int {
        get { return _amount }
        set {
            _amount = newValue
            setPoints()
        }
    }
    
    /**
        A function that computes the number of points from an amount of something. 
        For example, if a player inputs 5 grain then they will receive 2 points.
        - parameter amount: the amount given
        - returns: the number of points based on amount
    */
    func pointsByAmount(amount: Int) -> Int {abort()}
    
    func setPoints() {
        points = pointsByAmount(_amount)
    }
}
