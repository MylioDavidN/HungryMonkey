//
//  ViewController.swift
//  hungrymonkey
//
//  Created by Dung Nguyen Tien on 4/28/16.
//  Copyright © 2016 David T. Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var background: UIView!
    
    var monkeyLocation = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add background image
        let bgImage = UIImage(named: "bg2.jpg")
        let bgView = UIImageView(image: bgImage)
        background.addSubview(bgView)
        
        // add monkey animation
        var imageNames = ["monkey_2", "monkey_3"]
        var images = [UIImage]()
        
        for i in 0..<imageNames.count {
            images.append(UIImage(named: imageNames[i])!)
        }
        
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        //imageView.center = CGPointMake(100, 150)
        
        imageView.startAnimating()
        background.addSubview(imageView)
        
        
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if imageView.frame.contains(location) {
                monkeyLocation.x = location.x
                monkeyLocation.y = 300
                imageView.center = monkeyLocation
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if imageView.frame.contains(location) {
                // move monkey only along the x axis
                monkeyLocation.x = location.x
                monkeyLocation.y = 300
                imageView.center = monkeyLocation
                
            }
        }

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        imageView.center = monkeyLocation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

