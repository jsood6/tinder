//
//  CardsViewController.swift
//  lab8-Tinder
//
//  Created by jsood on 4/13/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet var backgroundView: UIView!

    var cardInitialCenter: CGPoint!
    var topOfView: Bool!
    var location: CGPoint!
    //var cardNewPosition: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardInitialCenter = profileImageView.center
        print("cardInitCenter:", cardInitialCenter)
        
//        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapImageView(_:)) )
//        recognizer.numberOfTapsRequired = 1
//        profileImageView.addGestureRecognizer(recognizer)
        
        // Do any additional setup after loading the view.
    }
    
//    @objc func tapImageView(_ gesture: UITapGestureRecognizer){
////        print("location:", self.location)
//        if (gesture.state == .began){
//            self.location = gesture.location(in: profileImageView)
//            print("location:", self.location)
//        }
//    }
    
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
    
//        print("inside pan image function")
        let translation = sender.translation(in: view)
        let location = sender.location(in: profileImageView)
//        print("sender", sender)
//        print("translation", translation)
//        print("location in didPanImage", location)
        //don't know how to check if user touched top or bottom half of the imageView(check step 2)

        let midPoint = (profileImageView.frame.height / 2)
        
        if (location.y < midPoint){
//            print("drag top of image", location.y)
//            print("midPoint", midPoint)
            if (translation.x < 0 ){
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-15 * Double.pi / 180))
                profileImageView.animationDuration = 0.5
            } else {
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(15 * Double.pi / 180))
                profileImageView.animationDuration = 0.5
            }
        } else {
            if (translation.x < 0 ){
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(15 * Double.pi / 180))
                profileImageView.animationDuration = 0.5
            } else {
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-15 * Double.pi / 180))
                profileImageView.animationDuration = 0.5
            }

        }
        
        
        
    
        if (sender.state == .began){
            print("inside began")
            //let imageView = sender.view as! UIImageView
            profileImageView.isUserInteractionEnabled = true
            //profileImageView.center.y += backgroundView.frame.origin.y
            cardInitialCenter = profileImageView.center
        } else if (sender.state == .changed){
            profileImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
        } else if (sender.state == .ended){
            cardInitialCenter = profileImageView.center
        }
    }
    
    func imgAppearance(_ translation: CGPoint){
        if (translation.x > 50){
            profileImageView.isHidden = true
            self.profileImageView.center = CGPoint(x: self.cardInitialCenter.x , y: self.cardInitialCenter.y)
            profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(0 * Double.pi / 180))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.profileImageView.isHidden = false
            }
            
        } else {
            self.profileImageView.center = CGPoint(x: cardInitialCenter.x , y: cardInitialCenter.y)
            profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(0 * Double.pi / 180))
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
