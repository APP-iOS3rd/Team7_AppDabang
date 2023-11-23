//
//  ViewController.swift
//  DatabaseDemo
//
//  Created by 박준영 on 11/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        //performSegue(withIdentifier: "goToSaveView", sender: self)
    }
    
    
    @IBAction func seeBtn(_ sender: Any) {
        //performSegue(withIdentifier: "goToSeeView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSeeView" {
            if let seeVC = segue.destination as? SeeViewController {
            }
        } else if segue.identifier == "goToSaveView" {
            if let seeVC = segue.destination as? SaveViewController {
            }
        }
    }
}
