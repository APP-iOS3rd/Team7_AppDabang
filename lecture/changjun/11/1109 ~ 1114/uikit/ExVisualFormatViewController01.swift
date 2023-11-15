//
//  ExVisualFormatViewController01.swift
//  AutoLayoutCodeDemo
//
//  Created by phang on 11/14/23.
//

import UIKit

class ExVisualFormatViewController01: UIViewController {
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        imageView.image = UIImage(named: "waterfall_maple")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        let views = ["myImage": imageView]
        var constraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[myImage]-|", metrics: nil, views: views)
        constraint += NSLayoutConstraint.constraints(withVisualFormat: "[myImage(200)]", metrics: nil, views: views)
        let centerXConst = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYConst = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate(constraint + [centerXConst, centerYConst])
    }
}
