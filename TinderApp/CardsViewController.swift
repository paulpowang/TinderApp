//
//  CardsViewController.swift
//  TinderApp
//
//  Created by paul on 10/19/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    var cardInitialCenter: CGPoint!
    var divisor: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        divisor = (view.frame.width / 2) / 0.61
        cardInitialCenter = photoImage.center
    }
    
    @IBAction func panGestureOnPhotoImage(_ sender: UIPanGestureRecognizer) {
        
        
        let imageView = sender.view as! UIImageView
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        let xFromCenter = imageView.center.x - view.center.x
        
        imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
        
        if location.y < cardInitialCenter.y {
            imageView.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)
        } else {
            imageView.transform = CGAffineTransform(rotationAngle: xFromCenter / -divisor)
        }
        
        if sender.state == .began {
            print("Started pan")
        } else if sender.state == .changed {
            
        } else if sender.state == .ended {
            if imageView.center.x < cardInitialCenter.x - 50 {
                //animate to the right
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
                    imageView.alpha = 0
                })
            } else if imageView.center.x > cardInitialCenter.x + 50 {
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.center = CGPoint(x: imageView.center.x + 500, y: imageView.center.y)
                    imageView.alpha = 0
                })
            } else {
                imageView.center = cardInitialCenter
                imageView.transform = CGAffineTransform.identity
            }
        }
    }
    
    
    @IBAction func doubleTapOnPhotoImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ProfileModal", sender: nil)
    }
    
}
