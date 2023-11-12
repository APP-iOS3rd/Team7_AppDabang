//
//  APIManager.swift
//  View_Practice01
//
//  Created by lkh on 11/12/23.
//

import Foundation

class SearchApiManager {
    static var shared = SearchApiManager()
    
    init() { }
    
    private let baseURL = "https://openapi.naver.com/v1/search/shop.json"
    
    func fetchSearchApi(queryValue: String) async throws -> Welcome? {
        let clientID = ""
        let clientSecret = ""
        
        let query: String  = "https://openapi.naver.com/v1/search/news.json?query=\(queryValue)"
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL: URL = URL(string: encodedQuery)!
        
        var requestURL = URLRequest(url: queryURL)
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: requestURL)
            let searchInfo: Welcome = try JSONDecoder().decode(Welcome.self, from: data)
            return searchInfo
        } catch {
            throw error
        }
    }
}
