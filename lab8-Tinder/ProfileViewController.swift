//
//  ProfileViewController.swift
//  lab8-Tinder
//
//  Created by jsood on 4/14/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    var profileImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = profileImage
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapNavBar(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
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
