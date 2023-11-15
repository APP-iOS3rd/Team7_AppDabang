//
//  ViewController.swift
//  AutoLayoutCodeDemo
//
//  Created by phang on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        createLayout()
        createImageLayout()
    }

    private func createLayout() {
        let myLabel = UILabel()
        myLabel.text = "My Label"
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let myButton = UIButton()
        myButton.setTitle("My Button", for: .normal)
        myButton.backgroundColor = .cyan
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(myLabel)
        self.view.addSubview(myButton)
        
//        var myConstraint = NSLayoutConstraint(item: myLabel,
//                                            attribute: NSLayoutConstraint.Attribute.centerY,
//                                            relatedBy: NSLayoutConstraint.Relation.equal,
//                                            toItem: self.view,
//                                            attribute: NSLayoutConstraint.Attribute.centerY,
//                                            multiplier: 1.0,
//                                            constant: 0)
//        self.view.addConstraint(myConstraint)
//        
//        myConstraint = NSLayoutConstraint(item: myLabel,
//                                            attribute: NSLayoutConstraint.Attribute.centerX,
//                                            relatedBy: NSLayoutConstraint.Relation.equal,
//                                            toItem: self.view,
//                                            attribute: NSLayoutConstraint.Attribute.centerX,
//                                            multiplier: 1.0,
//                                            constant: 0)
//        self.view.addConstraint(myConstraint)
//        
//        myConstraint = NSLayoutConstraint(item: myButton,
//                                            attribute: NSLayoutConstraint.Attribute.trailing,
//                                            relatedBy: NSLayoutConstraint.Relation.equal,
//                                            toItem: myLabel,
//                                            attribute: NSLayoutConstraint.Attribute.leading,
//                                            multiplier: 1.0,
//                                            constant: -10)
//        self.view.addConstraint(myConstraint)
//        
//        myConstraint = NSLayoutConstraint(item: myButton,
//                                            attribute: NSLayoutConstraint.Attribute.firstBaseline,
//                                            relatedBy: NSLayoutConstraint.Relation.equal,
//                                            toItem: myLabel,
//                                            attribute: NSLayoutConstraint.Attribute.firstBaseline,
//                                            multiplier: 1.0,
//                                            constant: 0)
//        self.view.addConstraint(myConstraint)
        
        NSLayoutConstraint.activate([
            myLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myButton.trailingAnchor.constraint(equalTo: myLabel.leadingAnchor, constant: -10),
            myButton.firstBaselineAnchor.constraint(equalTo: myLabel.firstBaselineAnchor)
        ])
    }
    
    private func createImageLayout() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bmw_x6")
        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
