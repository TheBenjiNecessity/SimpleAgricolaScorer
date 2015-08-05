//
//  StartViewController.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-02-11.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    var tappedButtonTitle: NSString?
    
    @IBOutlet var whiteButton: UIButton!
    @IBOutlet var purpleButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    @IBOutlet var orangeButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    
    @IBAction func playerSelect(sender: AnyObject?) {
        tappedButtonTitle = (sender as! UIButton).currentTitle!
        navigateToScorerForPlayer()
    }
    
    func navigateToScorerForPlayer(){
        performSegueWithIdentifier("showScorerForPlayer", sender: self);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showScorerForPlayer" {
            let svc = segue.destinationViewController as! ScorerTableViewController
            
            svc.player = tappedButtonTitle! as String
        }
    }
}
