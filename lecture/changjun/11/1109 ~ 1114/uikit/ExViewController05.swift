//
//  ExViewController05.swift
//  AutoLayoutCodeDemo
//
//  Created by phang on 11/13/23.
//

import UIKit

class ExViewController05: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red
        
        let greenView = UIView()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .green
        
        self.view.addSubview(redView)
        self.view.addSubview(greenView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            greenView.topAnchor.constraint(equalTo: view.topAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor),
        ])
        
    }
}
