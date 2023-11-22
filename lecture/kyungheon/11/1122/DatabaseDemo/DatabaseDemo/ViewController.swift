//
//  ViewController.swift
//  DatabaseDemo
//
//  Created by 박준영 on 11/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var name: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var status: UILabel!
    
    var databasePath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDB()
    }
    
    // 데이터베이스 초기화
    func initDB() {
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        databasePath = dirPaths[0].appendingPathExtension("contacts.db").path
        
        if  !filemgr.fileExists(atPath: databasePath) {
            
            let contactDB = FMDatabase(path: databasePath)
            if contactDB.open() {
                let sql_stmt = "create table if not exists contacts ( id integer primary key autoincrement, name text, address text, phone text)"
                if !contactDB.executeStatements(sql_stmt) {
                    print("Error: \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error: \(contactDB.lastErrorMessage())")
            }
        } // end if
    }
    
    @IBAction func saveContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
        
        if contactDB.open() {
            let sql = "insert into contacts (name, address, phone) values ('\(name.text ?? "")', '\(address.text ?? "")','\(phone.text ?? "")')"
            
            do {
                try contactDB.executeUpdate(sql, values: nil)
            } catch {
                status.text = "contact 추가 실패!!"
            }
            
            status.text = "Contact Added"
            name.text = ""
            address.text = ""
            phone.text = ""
            
            contactDB.close()
        } else {
            status.text = "DB 열기 오류발생"
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    @IBAction func findContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
        var items = [Contact]()
        
        if contactDB.open() {
            let sql = "select name, address, phone from contacts where name='\(name.text ?? "")'"
            
            do {
                let results: FMResultSet? = try contactDB.executeQuery(sql, values: nil)
                
                while results?.next() == true {
                    let name = results?.string(forColumn: "name")
                    let address = results?.string(forColumn: "address")
                    let phone = results?.string(forColumn: "phone")
                    
                    items.append(Contact(name: name, address: address, phone: phone))
                }
                
            } catch {
                print("Error: \(contactDB.lastErrorMessage())")
            }
            
            contactDB.close()
            
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
        
        for i in items {
            print("\(i.address ?? ""), \(i.phone ?? "")" )
            address.text = "\(i.address ?? "")"
            phone.text = "\(i.phone ?? "")"
        }
    }
    
}

struct Contact {
    let name: String?
    let address: String?
    let phone: String?
}
