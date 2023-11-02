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
    
    func fetchPopularMovie(page: Int, completionHandler: @escaping ([Movie]?) -> Void) {
        if let url = URL(string: "\(baseURL)popular?api_key=\(apiKey)&language=en-US&page=\(page)") {
            let task = session.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print("PopularMovie - An Error Occured \(err.localizedDescription)")
                    completionHandler(nil)
                    return
                }
                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("PopularMovie - Wrong MIME type!")
                    completionHandler(nil)
                    return
                }
                if let jsonData = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedModel = try decoder.decode(ResponseModel.self, from: jsonData)
                        let movieModel = decodedModel.result
                        completionHandler(movieModel)
                    } catch {
                        print("PopularMovie - JSON error: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchNowPlayingMovie(page: Int, completionHandler: @escaping ([Movie]?) -> Void) {
        if let url = URL(string: "\(baseURL)now_playing?api_key=\(apiKey)&language=en-US&page=\(page)") {
            let task = session.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print("NowPlayingMovie - An Error Occured \(err.localizedDescription)")
                    completionHandler(nil)
                    return
                }
                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("NowPlayingMovie - Wrong MIME type!")
                    completionHandler(nil)
                    return
                }
                if let jsonData = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedModel = try decoder.decode(ResponseModel.self, from: jsonData)
                        let movieModel = decodedModel.result
                        completionHandler(movieModel)
                    } catch {
                        print("NowPlayingMovie - JSON error: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchMovieDetail(id: Int, completionHandler: @escaping (Movie?) -> Void) {
        if let url = URL(string: "\(baseURL)\(id)") {
            let task = session.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print("NowPlayingMovie - An Error Occured \(err.localizedDescription)")
                    completionHandler(nil)
                    return
                }
                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("NowPlayingMovie - Wrong MIME type!")
                    completionHandler(nil)
                    return
                }
                if let jsonData = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedModel = try decoder.decode(Movie.self, from: jsonData)
                        completionHandler(decodedModel)
                    } catch {
                        print("NowPlayingMovie - JSON error: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
}
