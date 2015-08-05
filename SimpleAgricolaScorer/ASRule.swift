//
//  ASRule.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-05-30.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASRule: NSObject {
    static var mainPoints: Int = 0;
    private var p: Int = 0
    
    var points: Int {
        set {
            ASRule.mainPoints -= p
            p = newValue
            ASRule.mainPoints += p
            NSNotificationCenter.defaultCenter().postNotificationName("finalScoreNotification", object: nil)
        }
        get {
            return p
        }
    }
    
    func setPointsByIndex(index: Int) {}
}
