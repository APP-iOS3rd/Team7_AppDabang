//
//  ExViewController04.swift
//  AutoLayoutCodeDemo
//
//  Created by phang on 11/13/23.
//

import UIKit

class ExViewController04: UIViewController {
    private let tapButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        tapButton.setTitle("Tap Me", for: .normal)
        tapButton.backgroundColor = .blue
        tapButton.setTitleColor(.white, for: .normal)
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tapButton)
        
        NSLayoutConstraint.activate([
            tapButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tapButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tapButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
        ])
    }
}
