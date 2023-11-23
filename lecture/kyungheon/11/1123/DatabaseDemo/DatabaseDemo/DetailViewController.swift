//
//  DetailViewController.swift
//  DatabaseDemo
//
//  Created by lkh on 11/23/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var wkwebview: WKWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let urlString = urlString, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            wkwebview.load(request)
        }
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
