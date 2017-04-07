//
//  ProfileViewController.swift
//  TinderClone
//
//  Created by Aarnav Ram on 06/04/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var imageFromCards: UIImage?
    
    @IBOutlet weak var mainImgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageFromCards = imageFromCards {
            mainImgView.image = imageFromCards
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
