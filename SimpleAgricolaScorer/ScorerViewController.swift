//
//  ScorerViewController.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-02-12.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

enum Player {
    case White
    case Blue
    case Purple
    case Orange
    case Green
    case None
}

class ScorerViewController: UIViewController {

    var player: NSString
    
    required init?(coder aDecoder: NSCoder) {
        self.player = "None"
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = (player as String) + " Player"

        //title = player + " Player"
        //if let player = player {
//            switch player {
//                case .White:
//                    title = "White Player"
////                    tabBarItem.title = "White Player"
////                    navigationController?.title = "White Player"
//                default:
//                    title = "No Player"
////                    tabBarItem.title = "No Player"
////                    navigationController?.title = "No Player"
//            }
        //}
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
