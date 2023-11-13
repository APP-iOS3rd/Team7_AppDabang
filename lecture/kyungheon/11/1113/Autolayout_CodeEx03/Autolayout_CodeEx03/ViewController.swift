//
//  ViewController.swift
//  Autolayout_CodeEx03
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
        let imageView = UIImageView()
        imageView.image = UIImage(named: "waterfall_maple")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        let label = UILabel()
        label.text = "Autolayout..!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        let constraints = [
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        let labelConstraints = [
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(labelConstraints)
    }
}

