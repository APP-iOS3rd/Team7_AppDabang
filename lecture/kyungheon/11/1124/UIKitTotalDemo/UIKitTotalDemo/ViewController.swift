//
//  ViewController.swift
//  UIKitTotalDemo
//
//  Created by lkh on 11/23/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var titleTextfiled: UITextField!
    
    @IBOutlet weak var urlTextfield: UITextField!
    
    
    var manageObjectContext: NSManagedObjectContext?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initCoreData()
    }
    
    func initCoreData() {
        let container = NSPersistentContainer(name: "UIKitTotalDemo")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error {
                fatalError("initCoreData Error: \(error)")
            } else {
                self.manageObjectContext = container.viewContext
            }
        })
    }

    @IBAction func saveBtn(_ sender: Any) {
        if let context = self.manageObjectContext, let entityDescription = NSEntityDescription.entity(forEntityName: "Info", in: context) {
            
            let contact = Info(entity: entityDescription, insertInto: manageObjectContext)
            
            contact.name = titleTextfiled.text
            contact.url = urlTextfield.text
            
            do {
                try manageObjectContext?.save()
                
                titleTextfiled.text = ""
                urlTextfield.text = ""
            } catch let error {
                print(error)
            }
            
        }
    }
    
    @IBAction func pullBtn(_ sender: Any) {
       // performSegue(withIdentifier: "showDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.manageObjectContext = self.manageObjectContext
            }
        }
    }
}

