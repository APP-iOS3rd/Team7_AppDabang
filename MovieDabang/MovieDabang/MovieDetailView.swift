//
//  MovieDetailView.swift
//  MovieDabang
//
//  Created by 박선구 on 11/2/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    struct Movie: Codable, Identifiable {
        let id: Int
        let title: String
        let overview: String
        let posterPath: String
        let releaseDate: String
        let voteAverage: Double
    }
    
    @State var like : Bool = false
    
//    let Movie = ["name" : "과속스캔들", "date" : "2007.11.14", "people" : "264K", "imageName" : "testImage"]
    
    var body: some View {
        Form {
            Section(content: {
                Image("testImage")
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text("과속스캔들")
                    .font(.largeTitle)
                
                Text("2007.11.14")
                    .font(.headline)
                
                Text("264만명")
                    .font(.headline)
                Spacer()
                HStack{
                    Text("좋아요")
                    Spacer()
                    Image(systemName: like == false ? "heart" : "heart.fill")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .onTapGesture {
                            touchHeart()
                        }
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
#Preview {
    MovieDetailView()
}
