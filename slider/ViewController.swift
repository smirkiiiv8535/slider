//
//  ViewController.swift
//  slider
//
//  Created by 林祐辰 on 2020/4/20.
//  Copyright © 2020 smirkiiiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var meetSlider: UISlider!
    @IBOutlet weak var goodBoy: UIImageView!
    @IBOutlet weak var moon: UIImageView!
    @IBOutlet weak var goodGirl: UIImageView!
    
    
    let angle = CGFloat.pi/180
    var boyCenter = CGPoint()
    var girlCenter = CGPoint()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        moon.move360()
        goodBoy.transform = CGAffineTransform(rotationAngle:angle);
        goodGirl.transform = CGAffineTransform(rotationAngle:angle)
        boyCenter = goodBoy.center
        girlCenter = goodGirl.center
    }
    
    @IBAction func moonSlider(_ sender: UISlider) {

        let radian = Double(9.3)*Double.pi/180
        
        goodBoy.center = CGPoint(x: Double(moon.center.x) - 12 - 231*cos(radian/3*Double(sender.value)),
                                y: Double(moon.center.y) - 231*sin(radian/3*Double(sender.value)) )
        
        goodGirl.center = CGPoint(x: Double(moon.center.x) + 12 + 231*cos(radian*Double(sender.value))
                , y: Double(moon.center.y) - 231*sin(radian*Double(sender.value)))
        

              if(sender.value == 14)
              {
                  moon.stopMoving()
              }else {
                  moon.move360()

              }
          }
    }


extension UIImageView{

func move360(){
       let round360 = CABasicAnimation(keyPath: "transform.rotation.z")
       round360.fromValue = 0
       round360.toValue = CGFloat.pi*2
       round360.duration = 5
       round360.repeatCount = .greatestFiniteMagnitude
       layer.add(round360,forKey: "nil")
       
   }

   func stopMoving(){
       layer.removeAllAnimations()
   }

}
