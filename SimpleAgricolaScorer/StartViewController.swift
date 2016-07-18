//
//  StartViewController.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-02-11.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet var whiteButton: UIButton!
    @IBOutlet var purpleButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    @IBOutlet var orangeButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    
    let playersDictionary: [String: ASPlayer] = ["White": ASPlayer(title: "White"),
                                                 "Purple": ASPlayer(title: "Purple"),
                                                 "Blue": ASPlayer(title: "Blue"),
                                                 "Orange": ASPlayer(title: "Orange"),
                                                 "Green": ASPlayer(title: "Green")]
    
    @IBAction func playerSelect(sender: AnyObject?) {
        let playerKey = playerKeyForButton(sender as! UIButton)
        
        let player = playersDictionary[playerKey]
        if let p = player {
            navigateToScorerForPlayer(p)
        } else {
            fatalError("PlayerKey not found")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showScorerForPlayer" {
            let svc = segue.destinationViewController as! ScorerTableViewController
            svc.player = sender as? ASPlayer
        }
    }
    
    /* Helper functions */
    func navigateToScorerForPlayer(player: ASPlayer){
        performSegueWithIdentifier("showScorerForPlayer", sender: player);
    }
    
    func playerKeyForButton(button: UIButton) -> String {
        switch button {
        case whiteButton:
            return "White"
        case purpleButton:
            return "Purple"
        case blueButton:
            return "Blue"
        case greenButton:
            return "Green"
        case orangeButton:
            return "Orange"
        default:
            return ""
        }
    }
}
