//
//  SecondViewController.swift
//  closure
//
//  Created by Minaya Yagubova on 15.02.23.
//

import UIKit

class SecondViewController: UIViewController {
  //  var buttonActionCallback: (()->())

    var buttonActionCallback: ((UIColor)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func red(_ sender: Any) {
        buttonActionCallback?(.red)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func white(_ sender: Any) {
        buttonActionCallback?(.white)
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func blue(_ sender: Any) {
        buttonActionCallback?(.blue)
        navigationController?.popViewController(animated: true)
    }
}
