//
//  LimitPickerViewController.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-03-24.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

class LimitPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

   @IBOutlet var limitPicker: UIPickerView!
   var upperLimit: Int;
   var chosenValue: Int?;
   
   /* ================================== init methods ================================== */
   convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, upperLimit upperLimitValue: Int) {
      self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
      upperLimit = upperLimitValue;
   }
   
   override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
      upperLimit = 1;
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
   }

   required init(coder aDecoder: NSCoder) {
      upperLimit = 1;
      super.init(coder: aDecoder);
   }
   
//   convenience override init() {
//    
//      self.init(nibName: nil, bundle: nil);
//   }
   
   /* ================================== delegate methods ================================== */
   func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
      return String(row);
   }
   
   func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      chosenValue = row;
   }
   
   func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return upperLimit;
   }
   
   func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
      return 1;
   }
   
   /* ================================== view methods ================================== */
    override func viewDidLoad() {
      super.viewDidLoad()
      limitPicker.delegate = self;
      limitPicker.dataSource = self;
      
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
