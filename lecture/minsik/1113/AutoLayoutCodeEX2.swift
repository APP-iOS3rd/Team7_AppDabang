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
        
        lableHello.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lableHello.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
        //lableWolrd.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lableWolrd.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        lableWolrd.leadingAnchor.constraint(equalTo: lableHello.trailingAnchor, constant: 20).isActive = true
    }


}

