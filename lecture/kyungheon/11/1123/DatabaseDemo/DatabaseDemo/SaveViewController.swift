//
//  SaveViewController.swift
//  DatabaseDemo
//
//  Created by lkh on 11/23/23.
//

import UIKit

class SaveViewController: UIViewController {
    
    @IBOutlet var name: UITextField!
    @IBOutlet var exp: UITextField!
    @IBOutlet var url: UITextField!
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
        //print(dirPaths)
        databasePath = dirPaths[0].appendingPathExtension("study.db").path
        print(databasePath)
        if  !filemgr.fileExists(atPath: databasePath) {
            
            let studyDB = FMDatabase(path: databasePath)
            if studyDB.open() {
                let sql_stmt = "create table if not exists study ( id integer primary key autoincrement, name text, exp text, url text)"
                if !studyDB.executeStatements(sql_stmt) {
                    print("Error: \(studyDB.lastErrorMessage())")
                }
                studyDB.close()
            } else {
                print("Error: \(studyDB.lastErrorMessage())")
            }
        } // end if
    }
    
    @IBAction func saveContact(_ sender: Any) {
        let studyDB = FMDatabase(path: databasePath)
        
        if studyDB.open() {
            let sql = "insert into study (name, exp, url) values ('\(name.text ?? "")', '\(exp.text ?? "")','\(url.text ?? "")')"
            
            do {
                try studyDB.executeUpdate(sql, values: nil)
            } catch {
                status.text = "Shared 추가 실패!!"
            }
            
            status.text = "Shared Added"
            name.text = ""
            exp.text = ""
            url.text = ""
            
            studyDB.close()
        } else {
            status.text = "DB 열기 오류발생"
            print("Error: \(studyDB.lastErrorMessage())")
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

struct Study {
    let name: String?
    let exp: String?
    let url: String?
}
