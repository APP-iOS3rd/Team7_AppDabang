//
//  NowPlayingMovies.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: NowPlaying Movie List

struct NowPlayingMovies: View {
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (movieViewModel.nowPlayingMovie) { movie in
                    let voteAverage = String(format: "%.2f", movie.voteAverage)
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        HStack {
                            Text("\(movie.title)")
                                .lineLimit(2)
                            Spacer()
                            Group{
                                Text("⭐️")
                                    .frame(width: 20)
                                Text(voteAverage)
                                    .frame(width: 40)
                            }
                        }
                    }
                }
                .navigationTitle(Text("NowPlaying Movie List"))
            }
        }
    }
}

#Preview {
    NowPlayingMovies().environmentObject(MovieViewModel())
}
