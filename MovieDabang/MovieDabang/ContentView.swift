//
//  ContentView.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// Movie 구조체 선언
struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
}

// JSON 데이터 로딩
var movieData: [movie] = loadJson("moiveData.json")

// 데이터 저장소 구조체 추가
class movieStore: ObservableObject {
    @Published var movies: [movie]
    init(movies: [movie] = []) {
        self.movie = movie
    }
}

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (0..<movieStore.moives.count, id: \.self) { i in
                                
            }
            .navigationTitle(Text("Movie List"))
        }
    }
}

#Preview {
    ContentView()
}
