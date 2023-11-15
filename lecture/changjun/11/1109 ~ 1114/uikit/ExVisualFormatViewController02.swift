//
//  ExVisualFormatViewController02.swift
//  AutoLayoutCodeDemo
//
//  Created by phang on 11/14/23.
//

import UIKit

class ExVisualFormatViewController02: UIViewController {
    private let redView = UIView()
    private let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(redView)
        self.view.addSubview(greenView)
        
        let views = ["redView": redView, "greenView": greenView]
        var constraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[redView(50)]", metrics: nil, views: views)
        constraint += NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[greenView(50)]", metrics: nil, views: views)
        constraint += NSLayoutConstraint.constraints(withVisualFormat: "|-10-[redView(100)]-10-[greenView(200)]-10-|", metrics: nil, views: views)
        NSLayoutConstraint.activate(constraint)
    }
}
