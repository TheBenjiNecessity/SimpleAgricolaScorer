//
//  ASLimitRow.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-04-27.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASLimitRow: ASRow {
    //var isShowingPicker: Bool = false
    var upperLimit: Int = -1
    
    init(limit: Int) {
        super.init(title: "")
        upperLimit = limit
    }
}
