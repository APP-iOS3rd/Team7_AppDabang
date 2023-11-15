//
//  ViewController.swift
//  AutoLayoutCodeDemoEx
//
//  Created by 조민식 on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createTapMeLayout()
    }
    
    func createTapMeLayout() {
        let TapMe = UIButton()
        TapMe.setTitle("Tap Me", for: UIControl.State.normal)
        TapMe.backgroundColor = UIColor.blue
        
        TapMe.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(TapMe)
        
        TapMe.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        
        TapMe.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
        TapMe.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
    }
}

