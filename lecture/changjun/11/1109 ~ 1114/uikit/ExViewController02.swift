//
//  ExViewController02.swift
//  AutoLayoutCodeDemo
//
//  Created by phang on 11/13/23.
//

import UIKit

class ExViewController02: UIViewController {
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
            A.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            A.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            B.leadingAnchor.constraint(equalTo: A.trailingAnchor, constant: 20),
            B.centerYAnchor.constraint(equalTo: A.centerYAnchor)
        ])
    }
}
