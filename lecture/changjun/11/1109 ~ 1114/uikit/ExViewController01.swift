//
//  ExViewController01.swift
//  AutoLayoutCodeDemo
//
//  Created by phang on 11/13/23.
//

import UIKit

class ExViewController01: UIViewController {
    private let A = UILabel()
    private let B = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        createLabel()
    }
    
    private func createLabel() {
        A.text = "Hello"
        A.translatesAutoresizingMaskIntoConstraints = false
        
        B.text = "World"
        B.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(A)
        self.view.addSubview(B)
        
        NSLayoutConstraint.activate([
            A.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            A.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            B.firstBaselineAnchor.constraint(equalTo: A.firstBaselineAnchor),
            B.leadingAnchor.constraint(equalTo: A.trailingAnchor, constant: 20),
        ])
    }
}
