//
//  ViewController.swift
//  Autolayout_CodeEx01
//
//  Created by lkh on 11/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createImageLayout()
    }
    
    func createImageLayout() {
        let superview = self.view
        
        let myLabel1 = UILabel()
        myLabel1.translatesAutoresizingMaskIntoConstraints = false
        myLabel1.text = "Hello"
        
        let myLabel2 = UILabel()
        myLabel2.translatesAutoresizingMaskIntoConstraints = false
        myLabel2.text = "World"
        
        superview?.addSubview(myLabel1)
        superview?.addSubview(myLabel2)
        
        myLabel1.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: 20).isActive = true
        myLabel1.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true

        myLabel2.leadingAnchor.constraint(equalTo: myLabel1.trailingAnchor, constant: 20).isActive = true
        myLabel2.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
    }
}

