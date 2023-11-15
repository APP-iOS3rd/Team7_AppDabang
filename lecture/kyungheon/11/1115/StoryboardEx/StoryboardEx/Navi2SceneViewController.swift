//
//  Navi2SceneViewController.swift
//  StoryboardEx
//
//  Created by lkh on 11/15/23.
//

import UIKit

class Navi2SceneViewController: UIViewController {

   
    @IBOutlet weak var label1: UILabel!
    
    var shareText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = shareText
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
