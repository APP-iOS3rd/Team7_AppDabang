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
    @Published var nowPlayingMovie: [Movie] = []

    func getMovies() {
        (1...5).forEach {
            NetworkManager().fetchPopularMovie(page: $0) { movie in
                guard let movie = movie else { return }
                DispatchQueue.main.async {
                    self.popularMovies.append(contentsOf: movie)
                }
            }
            NetworkManager().fetchNowPlayingMovie(page: $0) { movie in
                guard let movie = movie else { return }
                DispatchQueue.main.async {
                    self.nowPlayingMovie.append(contentsOf: movie)
                }
            }
        }
    }
}
