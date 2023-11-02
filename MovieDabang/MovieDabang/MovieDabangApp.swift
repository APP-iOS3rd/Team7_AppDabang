//
//  MovieDabangApp.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI
import SwiftData

@main
struct MovieDabangApp: App {
    @StateObject var movieViewModel = MovieViewModel()
    @State private var isLoading = true
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if isLoading {
                    LaunchedView()
                } else {
                    MainView()
                        .environmentObject(movieViewModel)
                }
            }.onAppear {
                movieViewModel.getMovies()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
        }
        .modelContainer(for: DataItem.self)
    }
}
