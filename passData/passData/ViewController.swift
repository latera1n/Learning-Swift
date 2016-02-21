//
//  ViewController.swift
//  passData
//
//  Created by DengYuchi on 2/20/16.
//  Copyright © 2016 LateRain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldData: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func donePressed(sender: AnyObject) {
        performSegueWithIdentifier("segueDone", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueDone" {
            let nextVC = segue.destinationViewController as! NextViewController
            nextVC.data = textFieldData.text;
        }
    }
}

