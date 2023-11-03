//
//  MovieDetailView.swift
//  MovieDabang
//
//  Created by 박선구 on 11/2/23.
//

import SwiftUI
import SwiftData

// MARK: - detail view

struct MovieDetailView: View {
    @Environment(\.modelContext) private var context
    @State private var isLiked : Bool = false
    @State var movie: MovieProtocol

    var body: some View {
        Form {
            Section(content: {
                if let path = movie.posterPath {
                    AsyncImage(url: URL(string: "\(Movie.imageBaseURL)\(path)")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .infinity, alignment: .center)
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.rect(cornerRadius: 12))
                        case .failure:
                            Image(systemName: "photo")
                                .frame(maxWidth: .infinity, alignment: .center)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }

                Text(movie.title)
                    .font(.headline)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.yellow)
                        .frame(width: 20)
                    Text("\(String(format: "%.2f", movie.voteAverage))")
                        .font(.body)
                }
                
                Text(movie.releaseDate)
                    .font(.body)
                
                Text(movie.overview)
                    .font(.body)
                HStack{
                    Spacer()
                    Text("좋아요")
                        .font(.body)
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 18,height: 18)
                        .foregroundStyle(isLiked ? .red : .gray)
                                                .symbolEffect(.bounce, value: isLiked)
                        .onTapGesture {
                            if isLiked {
                                deleteMovie(movie)
                            } else {
                                addMovie()
                            }
                            touchHeart()
                        }
                }
                .padding()
            })
        }
    }
    
    private func addMovie() {
        let movie = DataItem(id: self.movie.id,
                             title: self.movie.title,
                             overview: self.movie.overview,
                             posterPath: self.movie.posterPath,
                             releaseDate: self.movie.releaseDate,
                             voteAverage: self.movie.voteAverage)
        context.insert(movie)
    }
    
    private func deleteMovie(_ movie: MovieProtocol) {
        // 현재 하트 눌러서 데이터 삭제 안됨..
        if let dataItem = movie as? DataItem {
            context.delete(dataItem)
        }
    }
    
    private func touchHeart() {
        self.isLiked.toggle()
    }
}

//#Preview {
//    MovieDetailView()
//}
