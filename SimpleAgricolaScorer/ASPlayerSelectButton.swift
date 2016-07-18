//
//  ASPlayerSelectButton.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2016-07-17.
//  Copyright © 2016 Benjamin Wishart. All rights reserved.
//

import UIKit

class ASPlayerSelectButton: UIButton {
    let darkenedLayer = CALayer()
    var player: ASPlayer? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //set up a darkened layer for when the user touches the view
        darkenedLayer.backgroundColor = UIColor.blackColor().CGColor;
        darkenedLayer.opacity = 0.2;
        darkenedLayer.cornerRadius = 5.0
        
        //set up the style of the button
        self.layer.cornerRadius = 5.0
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.layer.shadowOffset = CGSizeMake(1.0, 4.0)
        self.layer.shadowOpacity = 0.5
        
        //setup callbacks for when user interacts with button
        self.addTarget(self, action: #selector(onTouchDown), forControlEvents: UIControlEvents.TouchDown)
        self.addTarget(self, action: #selector(onTouchUpInside), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        darkenedLayer.frame = self.bounds
    }
    
    func onTouchDown() {
        self.layer.addSublayer(darkenedLayer)
        self.layer.shadowOpacity = 0
    }
    
    func onTouchUpInside() {
        darkenedLayer.removeFromSuperlayer()
        self.layer.shadowOpacity = 0.5
    }
}
