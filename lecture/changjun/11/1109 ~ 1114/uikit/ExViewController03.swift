//
//  ExViewController03.swift
//  AutoLayoutCodeDemo
//
//  Created by phang on 11/13/23.
//

import UIKit

class ExViewController03: UIViewController {
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        imageView.image = UIImage(named: "waterfall_maple")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "단풍과 폭포 사진"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        self.view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            descriptionLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
    }
}
