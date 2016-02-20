//
//  NoPopUpUITextField.swift
//  TipCalc
//
//  Created by DengYuchi on 2/20/16.
//  Copyright © 2016 LateRain. All rights reserved.
//

import Foundation
import UIKit

class NoPopUpUITextField: UITextField {
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == "cut:" || action == "copy:" || action == "paste:" || action == "select:" || action == "selectAll:" {
            return false
        }
//        switch action {
//        case "paste:":
//            return false;
//        default:
//            return true;
//        }
        return super.canPerformAction(action, withSender: sender)
    }
}