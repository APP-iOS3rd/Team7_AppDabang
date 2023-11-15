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
        
        createLableLayout()
    }
    
    func createLableLayout() {
        let lableHello = UILabel()
        let lableWolrd = UILabel()
        
        lableHello.translatesAutoresizingMaskIntoConstraints = false
        lableWolrd.translatesAutoresizingMaskIntoConstraints = false
        
        lableHello.text = "Hello"
        lableWolrd.text = "World"
        
        self.view.addSubview(lableHello)
        self.view.addSubview(lableWolrd)
        
        lableHello.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        lableHello.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        lableWolrd.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        lableWolrd.leadingAnchor.constraint(equalTo: lableHello.trailingAnchor, constant: 20).isActive = true
    }


}

