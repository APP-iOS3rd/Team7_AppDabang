//
//  ViewController.swift
//  UIKitDemo
//
//  Created by lkh on 11/10/23.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var lblHello: UILabel!
    
    @IBOutlet weak var txtName: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: Any) {
        lblHello.text = "Hello, " + (txtName.text ?? "")
    }
}
