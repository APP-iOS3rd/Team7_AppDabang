//
//  PopularMovies.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: Popular Movie List

struct PopularMovies: View {
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(movieViewModel.popularMovies) { movie in
                    let voteAverage = String(format: "%.2f", movie.voteAverage)
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        HStack {
                            Text("\(movie.title)")
                                .lineLimit(2)
                            Spacer()
                            Group{
                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color.yellow)
                                    .frame(width: 20)
                                Text(voteAverage)
                                    .frame(width: 40)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("Popular Movie List"))
        }
    }
}

#Preview {
    PopularMovies().environmentObject(MovieViewModel())
}
