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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func panGestureOnPhotoImage(_ sender: UIPanGestureRecognizer) {
        
        
        view.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
        } else if sender.state == .changed {
            print("Gesture is changing")
            
        } else if sender.state == .ended {
            print("Gesture ended")
        }
    }
    
    

}
