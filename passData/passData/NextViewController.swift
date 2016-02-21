//
//  NextViewController.swift
//  passData
//
//  Created by DengYuchi on 2/20/16.
//  Copyright © 2016 LateRain. All rights reserved.
//

import UIKit

class NextViewController : UIViewController {
    
    @IBOutlet weak var textFieldNextData: UITextField!
    var data: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldNextData.text = data
    }
}