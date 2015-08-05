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
    var chosenValue: Int?;
    var delegate: LimitPickerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LimitPicker.delegate = self;
        LimitPicker.dataSource = self;
        
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return String(row);
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenValue = row;
        delegate?.limitPickerView(LimitPicker, didSelectRow: row)
        NSNotificationCenter.defaultCenter().postNotificationName("limitPickerDidChange", object: nil)
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return upperLimit;
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
}
