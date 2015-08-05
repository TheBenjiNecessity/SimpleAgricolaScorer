//
//  ASScorer.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-07-09.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASScorer: NSObject {
    static let sharedScorer = ASScorer()
    var points = 0
    
    func addPoints(p: Int) {
        points += p;
    }
}
