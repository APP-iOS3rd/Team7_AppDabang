//
//  NavigationEx01.swift
//  DemoProject
//
//  Created by lkh on 11/1/23.
//

import SwiftUI

struct NavigationEx01: View {
    @State private var title: String = "first view"
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView(title: $title)) {
                    Text(title)
                }
            }                
        }
    }
}
    
    
struct SecondView: View {
    @Binding var title: String
    
    var body: some View {
        VStack {
            Text("\(title)")
        }
        .onAppear {
            title = "second view"
        }
        .onDisappear {
            title = "first view"
        }
    }
}
    
#Preview {
    NavigationEx01()
}
