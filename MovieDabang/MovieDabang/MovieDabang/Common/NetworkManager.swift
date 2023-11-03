//
//  NetworkManager.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - 데이터 받아서 변환

public class NetworkManager {
    private let session: URLSession
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    private let apiKey = Bundle.main.tmdbAPIKey
    
    init() {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        session = URLSession.init(configuration: config)
    }
    
    func fetchMovieData(endpoint: String, page: Int) async throws -> [Movie] {
        guard let url = URL(
            string: "\(baseURL)\(endpoint)?api_key=\(apiKey)&language=ko-KR&page=\(page)")
        else {
            throw NetworkError.invalidURLString
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidServerResponse
        }
        let decodedModel = try JSONDecoder().decode(ResponseModel.self, from: data)

        return decodedModel.result
    }
    
//    func fetchPopularMovie(page: Int, completionHandler: @escaping ([Movie]?) -> Void) {
//        if let url = URL(string: "\(baseURL)popular?api_key=\(apiKey)&language=ko-KR&page=\(page)") {
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if let err = error {
//                    print("PopularMovie - An Error Occured \(err.localizedDescription)")
//                    completionHandler(nil)
//                    return
//                }
//                guard let mime = response?.mimeType, mime == "application/json" else {
//                    print("PopularMovie - Wrong MIME type!")
//                    completionHandler(nil)
//                    return
//                }
//                if let jsonData = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let decodedModel = try decoder.decode(ResponseModel.self, from: jsonData)
//                        let movieModel = decodedModel.result
//                        completionHandler(movieModel)
//                    } catch {
//                        print("PopularMovie - JSON error: \(error.localizedDescription)")
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//    
//    func fetchNowPlayingMovie(page: Int, completionHandler: @escaping ([Movie]?) -> Void) {
//        if let url = URL(string: "\(baseURL)now_playing?api_key=\(apiKey)&language=ko-KR&page=\(page)") {
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if let err = error {
//                    print("NowPlayingMovie - An Error Occured \(err.localizedDescription)")
//                    completionHandler(nil)
//                    return
//                }
//                guard let mime = response?.mimeType, mime == "application/json" else {
//                    print("NowPlayingMovie - Wrong MIME type!")
//                    completionHandler(nil)
//                    return
//                }
//                if let jsonData = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let decodedModel = try decoder.decode(ResponseModel.self, from: jsonData)
//                        let movieModel = decodedModel.result
//                        completionHandler(movieModel)
//                    } catch {
//                        print("NowPlayingMovie - JSON error: \(error.localizedDescription)")
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
}
