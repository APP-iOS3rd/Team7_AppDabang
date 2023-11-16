//
//  AttractionTableViewController.swift
//  TableViewDemo
//
//  Created by lkh on 11/16/23.
//

import UIKit

class AttractionTableViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {

    // 테이블 목록
    var items = ["Kim", "Lee", "Park"]
    var attractionImages = [String]()
    var attractionNames = [String]()
    var webAddresses = [String]()
    
    // UISearchController 인스턴스 및 일치하는 검색 결과가 저장될 배열 추가
    var searching = false
    var matches = [Int]()
    var searchController = UISearchController(searchResultsController: nil)
    
    
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        initialize()
    }
    
    // 테이블 뷰 데이터 소스 생성
    // 앱이 로드될 때 일부 데이터로 배열을 초기화
    func initialize() {
        attractionNames = ["Buckingham Palace",
                           "The Eiffel Tower",
                           "The Grand Canyon",
                           "Windsor Castle",
                           "Empire State Building"]
        
        webAddresses = ["https://en.wikipedia.org/wiki/Buckingham_Palace",
                        "https://en.wikipedia.org/wiki/Eiffel_Tower",
                        "https://en.wikipedia.org/wiki/Grand_Canyon",
                        "https://en.wikipedia.org/wiki/Windsor_Castle",
                        "https://en.wikipedia.org/wiki/Empire_State_Building"]
        
        attractionImages = ["buckingham_palace.jpg",
                            "eiffel_tower.jpg",
                            "grand_canyon.jpg",
                            "windsor_castle.jpg",
                            "empire_state_building.jpg"]
        
        // 테이블 뷰의 예상 행 높이 설정
        // 테이블 보기 탐색을 추가할 때 행 높이가 축소되는 것을 방지하고, 테이블 렌더링 성능도 향상
        self.tableView.estimatedRowHeight = 50
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 검색 초기화
        // 테이블 보기 컨트롤러 인스턴스를 검색 컨트롤러에 대한 검색 창 및 결과 업데이트 위임지로 지정
        // 검색으로 인해 검색 결과 보기 컨트롤러가 모호해지는 것을 방지하기 위한 속성을 설정
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Attractions"
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // 결과 업데이트 대리자로 지정
    // 검색 창에 입력된 텍스트가 포함된 검색 컨트롤러 개체에 대한 참조가 전달됨.
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            matches.removeAll()
            
            for index in 0..<attractionNames.count {
                if attractionNames[index].lowercased().contains(searchText.lowercased()) {
                    matches.append(index)
                }
            }
            searching = true
        } else {
            searching = false
        }
        
        tableView.reloadData()
    }
    
    // 검색 취소 버튼 처리(검색 적용)
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        tableView.reloadData()
    }
    
    // 뷰가 보일 때 마다 리스트의 데이터를 다시 불러옴
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    // 테이블 안에 섹션이 1개
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 섹션별 행의 개수(검색 적용)
    // 검색 모등에서 행 수는 일치한 배열의 항목 수에 따라 달라짐
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searching ? matches.count : attractionNames.count
    }

    // items 값을 셀에 추가(검색 적용)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 'AttractionTableCell' 부분은 스토리보드 화면에서 테이블 뷰 셀'Table View Cell' 의 Identifier 에 넣은 이름으로 채움
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttractionTableCell", for: indexPath) as! AttractionTableViewCell

        // 사용자가 현재 검색을 수행 중인 경우 matches 배열에 대한 인덱스 값에서 가져와야 함
        let row = indexPath.row
        cell.attractionLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        cell.attractionLabel.text = searching ? attractionNames[ matches[row]] : attractionNames[row]
        
        let imageName = searching ? attractionImages[ matches[row]] : attractionImages[row]
        cell.attractionImage.image = UIImage(named: imageName)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // 목록 삭제(검색 적용중...)
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            // 삭제할 아이템 위치를 기록
            let row = indexPath.row
            // 검색 적용
            if self.searching {
                self.attractionNames.remove(at: matches[row])
                self.attractionImages.remove(at: matches[row])
                self.webAddresses.remove(at: matches[row])
                self.matches.remove(at: row)
                self.updateSearchResults(for: searchController)
                
            } else {
                self.attractionNames.remove(at: row)
                self.attractionImages.remove(at: row)
                self.webAddresses.remove(at: row)
            }
            
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Delete 를 한글로 변경
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    

    // 목록 순서 바꾸기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 아이템 위치를 기록
        var row = fromIndexPath.row
        
        // 이동할 아이템을 삭제
        let attractionName = self.attractionNames.remove(at: row)
        let attractionImage = self.attractionImages.remove(at: row)
        let webAddress = self.webAddresses.remove(at: row)
        
        // 삭제된 아이템을 이동할 위치로 삽입
        row = to.row
        self.attractionNames.insert(attractionName, at: row)
        self.attractionImages.insert(attractionImage, at: row)
        self.webAddresses.insert(webAddress, at: row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // (검색 적용)
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // segue의 전환시 어느 화면으로 이동하는 건지 구분
        if segue.identifier == "ShowAttractionDetails" {
            let detailView = segue.destination as! AttractionDetailViewController
            
            // 현재 테이블 뷰에 선택된 행의 순서를 가져옴
            let row = self.tableView.indexPathForSelectedRow!.row
            detailView.webSite = searching ? webAddresses[ matches[row]] : webAddresses[row]
        }
    }
    

}
