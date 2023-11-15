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
        
        createUILayout()
    }
    
    func createUILayout() {
        let redView = UIView()
        let greenView = UIView()
        
        redView.backgroundColor = UIColor.red
        greenView.backgroundColor = UIColor.green
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(redView)
        self.view.addSubview(greenView)
        
        let constraints = [
            redView.topAnchor.constraint(equalTo: self.view.topAnchor),
            redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            redView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/3),
            redView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/2),
            greenView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            greenView.topAnchor.constraint(equalTo: self.view.topAnchor),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

