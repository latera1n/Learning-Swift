//
//  ViewController.swift
//  CameraRoll
//
//  Created by DengYuchi on 2/21/16.
//  Copyright © 2016 LateRain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageViewMain: UIImageView!
    let imagePickerVC = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePickerVC.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAddPhotoTapped(sender: AnyObject) {
        imagePickerVC.allowsEditing = false
        imagePickerVC.sourceType = .PhotoLibrary
        presentViewController(imagePickerVC, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate method
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageViewMain.image = selectedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
