//
//  DetailViewController.swift
//  Photos
//
//  Created by Carlos Caballero on 11/16/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    var photo: Photo?
    var liked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if photo != nil {
            configureView(photo!)
        }
        self.navigationController?.navigationBar.topItem!.hidesBackButton = false
        navigationController?.setToolbarHidden(false, animated: true)
        navigationItem.leftItemsSupplementBackButton = true
    }

    func configureView(photo: Photo) {
        self.title = "Picture"
        userNameLabel.text = "User: \(photo.username)"
        likesLabel.text = "Likes: \(photo.likes)"
        if let url = NSURL(string: photo.url) {
            if let imagedata = NSData(contentsOfURL: url) {
               imageView.image = UIImage(data: imagedata)
            } else {
                showError()
            }
        } else {
            showError()
        }
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading Error", message: "Please check your connection and try agian.", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
    }

    func back(sender: UIBarButtonItem) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    @IBAction func pressedLike(sender: UIButton) {
        if !liked {
            photo?.likes!++
            liked = true
            self.likesLabel.text = "Likes: \(photo!.likes)"
        }
    }
    
    
}
