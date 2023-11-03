//
//  MainView.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - main tabview

struct MainView: View {
    @EnvironmentObject var movieViewModel: MovieViewModel
    @State private var selectedScreen = 1

    var body: some View {
        TabView(selection: $selectedScreen) {
            NowPlayingMovies()
                .environmentObject(movieViewModel)
                .tabItem {
                  Image(systemName: "sparkles")
                  Text("Now Playing")
                }
                .tag(0)
            PopularMovies()
                .environmentObject(movieViewModel)
                .tabItem {
                  Image(systemName: "person.3.fill")
                  Text("Popular")
                }
                .tag(1)
            MyMovies()
                .tabItem {
                  Image(systemName: "heart.fill")
                  Text("My Movie")
                }
                .tag(2)
        }
        .tint(Color.pink)
    }
}

#Preview {
    MainView().environmentObject(MovieViewModel())
}
