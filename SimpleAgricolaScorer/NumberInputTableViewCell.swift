//
//  NumberInputTableViewCell.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-05-26.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

protocol NumberPickerDelegate {
    func numberPickerView(numberPicker: UITextField, numberWasTyped number: Int)
}

class NumberInputTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var numberField: UITextField!
    var delegate: NumberPickerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numberField.delegate = self
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let newLength: Int = textField.text!.characters.count + string.characters.count - range.length;
        return (newLength > 2) ? false : true;
    }
    
    @IBAction func editingDidChange(sender: AnyObject) {
        delegate?.numberPickerView(numberField, numberWasTyped: Int(numberField.text!)!)
        NSNotificationCenter.defaultCenter().postNotificationName("numberPickerDidChange", object: nil)
    }

}
