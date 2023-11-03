//
//  Ex02.swift
//  Persistence
//
//  Created by lkh on 10/26/23.
//

import SwiftUI

struct Ex02: View {
    @State private var selectedIdx = 0
    @AppStorage("myStore") var idx = 0
    
    var body: some View {
        TabView(selection: $selectedIdx) {
            Text("A")
                .font(.system(size: 40))
                .tabItem {
                    Text("A")
                        .font(.headline)
                }
                .tag(0)
            
            Text("B")
                .font(.system(size: 40))
                .tabItem {
                    Text("B")
                        .font(.headline)
                }
                .tag(1)
            
            Text("C")
                .font(.system(size: 40))
                .tabItem {
                    Text("C")
                        .font(.headline)
                }
                .tag(2)
        }
        .onChange(of: selectedIdx) {
            idx = $0
        }
        .onAppear {
            selectedIdx = idx
        }
    }
}

#Preview {
    Ex02()
}
