//
//  MovieDetailView.swift
//  MovieDabang
//
//  Created by 박선구 on 11/2/23.
//

import SwiftUI

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
}

struct MovieDetailView: View {
    @State var like : Bool = false
    @Binding var movie : Movie
//    @State private var movie : Movie

//    let Movie = ["name" : "과속스캔들", "date" : "2007.11.14", "people" : "264K", "imageName" : "testImage"]
    
    
    var body: some View {
        Form {
            Section(content: {
                Image(movie.overview)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(movie.title)
                    .font(.largeTitle)
                
                Text(movie.releaseDate)
                    .font(.headline)
                
                Text("\(movie.voteAverage)")
                    .font(.headline)
                Spacer()
                HStack{
                    Spacer()
                    Text("좋아요")
//                    Spacer()
                    Image(systemName: like == false ? "heart" : "heart.fill")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .onTapGesture {
                            touchHeart()
                        }
                        .foregroundStyle(like ? .red : .gray)
                        .symbolEffect(.bounce, value: like)
                }
                .padding()
            })
        }
    }
    func touchHeart() {
        if like == false{
            like = true
        }else{
            like = false
        }
    }
}

//#Preview {
//    MovieDetailView()
//}
