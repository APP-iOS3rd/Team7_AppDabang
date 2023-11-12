//
//  SearchViewModel.swift
//  View_Practice01
//
//  Created by lkh on 11/12/23.
//

import Foundation

// MARK: - SearchViewModel
class SearchViewModel: ObservableObject {
    @Published var keyword: String = ""
    @Published var searchResult: [Item] = []
    
    private let searchApiManager = SearchApiManager.shared
    
    func loadSearchData() async {
        guard !keyword.isEmpty else { // 비어있을 때 방지
            return
        }
        do {
            if let result = try await searchApiManager.fetchSearchApi(queryValue: keyword) {
                searchResult = result.items
            } else {
                print("검색 실패")
            }
        } catch {
            print("에러: \(error)")
        }
    }
}
