//
//  ViewController.swift
//  TinderClone
//
//  Created by Aarnav Ram on 06/04/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainImgView: UIImageView!
    var cardInitialCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardInitialCenter = mainImgView.center
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onImgTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "seg", sender: nil)
        
    }

    @IBAction func onPanned(_ sender: Any) {
        let sender = sender as! UIPanGestureRecognizer
        let location = sender.location(in: view)
        print(location)
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        var initialTransform = CGAffineTransform.identity
        
        
        if sender.state == .changed {
            var center = cardInitialCenter
            center = mainImgView.center
            if translation.x > 50 {
                mainImgView.center = CGPoint(x: mainImgView.center.x + translation.x, y: mainImgView.center.y)

            } else if translation.x < -50 {
                mainImgView.center = CGPoint(x: mainImgView.center.x + translation.x, y: mainImgView.center.y)

            } else {
                mainImgView.center = CGPoint(x: mainImgView.center.x + translation.x/3, y: mainImgView.center.y)

            }
            //let transX = translation.x as? Double
            if (location.y > cardInitialCenter.y) {
                mainImgView.transform = mainImgView.transform.rotated(by: CGFloat(-1.0 * Double (translation.x/20) * M_PI / 180))
            } else {
                mainImgView.transform = mainImgView.transform.rotated(by: CGFloat(Double (translation.x/20) * M_PI / 180))
            }
            
            
        } else if sender.state == .ended {
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(restoreCenter), userInfo: nil, repeats: false)
                self.mainImgView.center = self.cardInitialCenter
                self.mainImgView.transform = initialTransform
            
        }
        
        
    }
    
    func restoreCenter() {
     //dummy
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ProfileViewController
        destinationVC.imageFromCards = self.mainImgView.image
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

