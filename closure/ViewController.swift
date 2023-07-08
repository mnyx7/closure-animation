//
//  ViewController.swift
//  closure
//
//  Created by Minaya Yagubova on 15.02.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomViewAnimation: UIView!
    
    @IBOutlet weak var centerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cornerRadiusAnimation()
//        rotateAnimation()
        basicAnimation(key: "cornerRadius", from: 0, to: 80)
        basicAnimation(key: "transform.rotation.z", from: 0, to: Double.pi)
        bottomViewAnimation()
        
        func basicAnimation(key: String, from: Any, to: Any){
            let animation = CABasicAnimation(keyPath: key)
            animation.fromValue = from
            animation.toValue = to
            animation.duration = 1.5
            animation.autoreverses = true
            animation.repeatCount = .infinity
            centerView.layer.add(animation, forKey:  nil)
        }
        
        func bottomViewAnimation (){
            UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat]) {
                self.bottomViewAnimation.layer.cornerRadius = 30
                self.bottomViewAnimation.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//                self.bottomViewAnimation.transform = CGAffineTransform(translationX: 200, y: -200)
                self.bottomViewAnimation.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }
        }
        
        
//        func cornerRadiusAnimation(){
//            let animation = CABasicAnimation(keyPath: "cornerRadius")
//            animation.fromValue = 0
//            animation.toValue = 80
//            animation.duration = 1.5
//            animation.autoreverses = true
//            animation.repeatCount = .infinity
//            centerView.layer.add(animation, forKey:  nil)
//        }
//        func rotateAnimation(){
//            let animation = CABasicAnimation(keyPath: "transform.rotation.z")
//            animation.fromValue = 0
//            animation.toValue = CGFloat.pi * 2
//            animation.duration = 1.5
//            animation.autoreverses = true
//            animation.repeatCount = .infinity
//            centerView.layer.add(animation, forKey: nil)
//        }
//
    }
    
    
    
    @IBOutlet weak var animationview: UIButton!
    
    
    @IBOutlet weak var animationTopConstraint: NSLayoutConstraint!
    
   
    
    func animate(){
        UIView.animate(withDuration: 2) {
            self.animationview.layer.cornerRadius = 120
        } completion: { _ in
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1) {
                self.animationTopConstraint.constant = 10
                self.view.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 2 ){
                    
                    self.animationTopConstraint.constant = 200
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    @IBAction func buttonAction(_ sender: Any) {
           animate()
           
   //        view.backgroundColor = .cyan
   //        let secondController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
   //        secondController.buttonActionCallback = { color in self.view.backgroundColor = color
   //        }
   //        navigationController?.show(secondController, sender: nil)
       }

}

