//
//  ViewController.swift
//  TipCalc
//
//  Created by DengYuchi on 2/19/16.
//  Copyright © 2016 LateRain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldAmount: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelPercentage: UILabel! {
        didSet {
            labelPercentage.font = labelPercentage.font.monospacedDigitFont
        }
    }
    @IBOutlet weak var labelTip: UILabel! {
        didSet {
            labelTip.font = labelTip.font.monospacedDigitFont
        }
    }
    @IBOutlet weak var labelTotal: UILabel! {
        didSet {
            labelTotal.font = labelTotal.font.monospacedDigitFont
        }
    }
    var amountString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider.minimumTrackTintColor = UIColor(red: 0, green: 200/255, blue: 83/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderTouchedDown(sender: AnyObject) {
        let textFieldAmountString = textFieldAmount.text!
        if textFieldAmountString != "" && (textFieldAmountString as NSString).substringToIndex(1) != "$" && textFieldAmountString != "." {
            dismissKeyboard(sender)
        }
    }
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        updateDisplay()
    }
    
    func updateDisplay() {
        let sliderValue = slider.value
        let tipPercentage = Int(sliderValue)
        labelPercentage.text = String(tipPercentage) + "%"
        if amountString != "" {
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = .CurrencyStyle
            let tip = Double(amountString)! * Double(tipPercentage) / 100
            labelTip.text = numberFormatter.stringFromNumber(tip)
            labelTotal.text = numberFormatter.stringFromNumber(Double(amountString)! + tip)
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
        let textFieldAmountString = textFieldAmount.text!
        if textFieldAmountString != "" && (textFieldAmountString as NSString).substringToIndex(1) != "$" && textFieldAmountString != "." {
            amountString = textFieldAmount.text!
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = .CurrencyStyle
            textFieldAmount.text = numberFormatter.stringFromNumber(Double(amountString)!)
            if textFieldAmount.text != "$0.00" {
                updateDisplay()
            } else {
                labelTip.text = "$0.00"
                labelTotal.text = "$0.00"
                amountString = ""
                textFieldAmount.text = ""
            }
        } else if textFieldAmountString == "" {
            labelTip.text = "$0.00"
            labelTotal.text = "$0.00"
            amountString = ""
        } else if textFieldAmountString == "." {
            labelTip.text = "$0.00"
            labelTotal.text = "$0.00"
            amountString = ""
            textFieldAmount.text = ""
        }
    }
}

