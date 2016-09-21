//
//  LimitPickerTableViewCell.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-04-22.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

protocol LimitPickerDelegate {
    func limitPickerView(limitPicker: UIPickerView, didSelectRow row: Int)
}

class LimitPickerTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var LimitPicker: UIPickerView!
    var upperLimit: Int = 1;
    var lowerLimit: Int = 0;
    var shouldShowPlus = true;
    var chosenValue: Int?;
    var delegate: LimitPickerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LimitPicker.delegate = self;
        LimitPicker.dataSource = self;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let value = row + lowerLimit
        
        if (value == upperLimit && shouldShowPlus) {
            return String(value) + "+";
        } else {
            return String(value);
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenValue = row + lowerLimit;
        delegate?.limitPickerView(LimitPicker, didSelectRow: row)//Does this row equate to what the user sees?
        NSNotificationCenter.defaultCenter().postNotificationName("limitPickerDidChange", object: nil)
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return upperLimit - (lowerLimit - 1);
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
}
