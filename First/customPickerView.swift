//
//  customPickerView.swift
//  First
//
//  Created by arun kumar on 05/08/18.
//  Copyright © 2018 arun kumar. All rights reserved.
//

import UIKit

class customPickerView: UIPickerView,UIPickerViewDataSource,UIPickerViewDelegate {

    var data = [Any]()
    var component = Int()
    var resTextF = UITextField()
    var selectedStr = String()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setupPickerView(textF:UITextField,dataArr:[Any],compo:Int) {
        
        self.resTextF = textF
        
        self.data = dataArr
        self.component = compo
        
        self.delegate = self
        self.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: "donePicker")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: "donePicker")
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        textF.inputView = self
        textF.inputAccessoryView = toolBar
    }
    @objc func donePicker() {
        self.resTextF.text = self.selectedStr
        self.resTextF.resignFirstResponder()
        if let table = self.resTextF.superview?.superview?.superview as? UITableView {
            table.reloadData()
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return component
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedStr = "\(data[row])"
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(data[row])"
    }

}
