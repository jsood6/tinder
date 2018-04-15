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
    //var cardNewPosition: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        print("inside pan image function")
        let translation = sender.translation(in: view)
        
        //don't know how to check if user touched top or bottom half of the imageView(check step 2)
        if(profileImageView.center.x > 180)
        {
            profileImageView.bo
            print(profileImageView.isAnimating)
            
            /*if(profileImageView.center.x > 230)
            {
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(30 * M_PI / 180))
                
                profileImageView.animateWithDuration( 0.3, options: .CurveEaseOut)
                               
                                                      /*animations: { () -> Void in
                                profileImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                }, completion: nil)*/
                
                /*[UIView animateWithDuration:5
                    delay:5
                    options:UIViewAnimationOptionCurveEaseOut
                    animations:^{
                    CGRect frame = view.frame;
                    frame.origin.y = self.view.frame.size.height-200;
                    frame.origin.x = 0;
                    view.frame = frame;
                    }completion:^(BOOL finished) {}];*/
            }*/
            //else{
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(30 * M_PI / 180))
            //}*/
        }
        else{
            profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-30 * M_PI / 180))
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
