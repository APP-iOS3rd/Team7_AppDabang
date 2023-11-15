//
//  ViewController.swift
//  Autolayout_CodeEx04
//
//  Created by lkh on 11/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createButton()
    }
    
    func createButton() {
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        let constraints = [
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

