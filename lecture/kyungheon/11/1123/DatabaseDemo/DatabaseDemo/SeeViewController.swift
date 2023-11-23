//
//  SeeViewController.swift
//  DatabaseDemo
//
//  Created by lkh on 11/23/23.
//

import UIKit
import WebKit

class SeeViewController: UITableViewController {
    
    @IBOutlet weak var uiTableView: UITableView!
    
    var studyArr: [Study] = []
    var databasePath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        pullStudyArrFromDB()
        //initDB()
        pullStudyArrFromDB()
    }
    
    func initialize() {
        self.tableView.estimatedRowHeight = 50
        navigationController?.navigationBar.prefersLargeTitles = true
        
//        let dummy = Study(name: "Lee", exp: " 1", url: "https://www.naver.com")
//        studyArr.append(contentsOf: [dummy])
    }
    
    // 데이터베이스 초기화
    func initDB() {
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        databasePath = dirPaths[0].appendingPathComponent("study.db").path
        print(databasePath)
        if !filemgr.fileExists(atPath: databasePath) {
            
            let studyDB = FMDatabase(path: databasePath)
            if studyDB.open() {
                let sql_stmt = "create table if not exists study (id integer primary key autoincrement, name text, exp text, url text)"
                if !studyDB.executeStatements(sql_stmt) {
                    print("Error: \(studyDB.lastErrorMessage())")
                }
                studyDB.close()
            } else {
                print("Error: \(studyDB.lastErrorMessage())")
            }
        }
    }
    
    func pullStudyArrFromDB() {
        let studyDB = FMDatabase(path: databasePath)
        
        if studyDB.open() {
            let querySQL = "SELECT name, exp, url FROM study"
            
            do {
                let results = try studyDB.executeQuery(querySQL, values: nil)
                
                while results.next() {
                    let name = results.string(forColumn: "name") ?? ""
                    let exp = results.string(forColumn: "exp") ?? ""
                    let url = results.string(forColumn: "url") ?? ""
                    let study = Study(name: name, exp: exp, url: url)
                    studyArr.append(study)
                }
            } catch let error {
                print("Error fetching studies: \(error.localizedDescription)")
            }
            
            studyDB.close()
            
        } else {
            print("Error: \(studyDB.lastErrorMessage())")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        uiTableView.reloadData()
        pullStudyArrFromDB()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studyArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeeCell", for: indexPath) as! SeeTableViewCell
        
        let study = studyArr[indexPath.row]
        cell.name.text = study.name
        cell.exp.text = study.exp
        
        print(cell.name.text, cell.exp.text)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let study = studyArr[indexPath.row]
        showWebView(withURL: study.url!)
    }
    
    func showWebView(withURL url: String) {
        guard let DetailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        DetailViewController.urlString = url
        navigationController?.pushViewController(DetailViewController, animated: true)
    }
}
