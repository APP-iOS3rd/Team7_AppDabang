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
        
        createImageLayout()
    }
    
    func createImageLayout() {
        let Image = UIImageView()
        let imageLable = UILabel()
        
        Image.image = UIImage(named: "waterfall_maple")
        Image.contentMode = .scaleToFill
        Image.translatesAutoresizingMaskIntoConstraints = false
        
        imageLable.text = "Autolayout..."
        imageLable.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(Image)
        self.view.addSubview(imageLable)
        
        let constraints = [
            Image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            Image.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 50),
            Image.widthAnchor.constraint(equalToConstant: 100),
            Image.heightAnchor.constraint(equalToConstant: 100),
            imageLable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageLable.topAnchor.constraint(equalTo: Image.bottomAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

