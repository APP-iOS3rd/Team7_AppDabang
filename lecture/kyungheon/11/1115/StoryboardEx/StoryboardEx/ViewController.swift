//
//  ViewController.swift
//  StoryboardEx
//
//  Created by lkh on 11/15/23.
//

import UIKit

class ViewController: UIViewController {
    
    let strArr = ["넌", "누구냐", "!"]
    var strIndex = 0


    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var btn1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelText.text = strArr[strIndex]
        textField.text = "입력"
    }

    @IBAction func pageChangeImg(_ sender: UIPageControl) {
        labelText.text =  strArr[sender.currentPage]

        strIndex = sender.currentPage
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        if let dest = segue.destination as? Navi2SceneViewController {
            dest.shareText = textField.text
        } else {
        }
    }
}

