//
//  MyMovies.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI
import SwiftData

// MARK: - 내가 좋아요 누른 영화들

struct MyMovies: View {
    @Environment(\.modelContext) private var context
    @Query private var movies: [DataItem]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(movies) { movie in
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
                .onDelete{ indexes in
                    for index in indexes {
                        deleteMovie(movies[index])
                    }
                }
            }
            .navigationTitle(Text("My Movies"))
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func deleteMovie(_ movie: DataItem) {
        context.delete(movie)
    }
}

#Preview {
    MyMovies()
}
