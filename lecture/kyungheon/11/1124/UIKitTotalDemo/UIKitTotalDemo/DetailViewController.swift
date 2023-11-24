//
//  DetailViewController.swift
//  UIKitTotalDemo
//
//  Created by lkh on 11/23/23.
//

import UIKit
import CoreData
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var manageObjectContext: NSManagedObjectContext?
    
    var selectedName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadURL()
    }
    
    func loadURL() {
        if let context = self.manageObjectContext, let entityDescription = NSEntityDescription.entity(forEntityName: "Info", in: context) {
            
            let request: NSFetchRequest<Info> = Info.fetchRequest()
            request.entity = entityDescription
            
            if let name = selectedName {
                let pred = NSPredicate(format: "name == %@", name)
                request.predicate = pred
            }
            
            do {
                let results = try context.fetch(request)
                
                if let match = results.first {
                    if let url = match.url, let webURL = URL(string: url) {
                        let request = URLRequest(url: webURL)
                        webView.load(request)
                    }
                } else {
                }
            } catch let error {
                print("\(error.localizedDescription)")
            }
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
