//
//  ViewController.swift
//  Autolayout_CodeEx02
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
        
        myLabel1.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 100).isActive = true
        myLabel1.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        
        myLabel2.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 100).isActive = true
        myLabel2.centerXAnchor.constraint(equalTo: myLabel1.centerXAnchor, constant: 60).isActive = true
        //myLabel2.leadingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: 20).isActive = true
    }
    
}

