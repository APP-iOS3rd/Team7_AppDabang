//
//  MovieViewModel.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - VM 

class MovieViewModel: ObservableObject {
    @Published var popularMovies: [Movie] = []
    @Published var nowPlayingMovies: [Movie] = []

    
    func getMovies() {
        for page in 1...5 {
            Task {
                do {
                    let popularMoviesData = try await NetworkManager().fetchMovieData(endpoint: "popular", page: page)
                    let nowPlayingMoviesData = try await NetworkManager().fetchMovieData(endpoint: "now_playing", page: page)

                    DispatchQueue.main.async {
                        self.popularMovies.append(contentsOf: popularMoviesData)
                        self.nowPlayingMovies.append(contentsOf: nowPlayingMoviesData)
                    }
                } catch NetworkError.invalidURLString {
                    print("invalidURLString")
                } catch NetworkError.invalidServerResponse {
                    print("invalidServerResponse")
                }
            }
        }
    }
    
//    func getMovies() {
//        (1...5).forEach {
//            NetworkManager().fetchPopularMovie(page: $0) { movie in
//                guard let movie = movie else { return }
//                DispatchQueue.main.async {
//                    self.popularMovies.append(contentsOf: movie)
//                }
//            }
//            NetworkManager().fetchNowPlayingMovie(page: $0) { movie in
//                guard let movie = movie else { return }
//                DispatchQueue.main.async {
//                    self.nowPlayingMovie.append(contentsOf: movie)
//                }
//            }
//        }
//    }
}
