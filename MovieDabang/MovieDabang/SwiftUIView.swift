//
//  SwiftUIView.swift
//  MovieDabang
//
//  Created by 박선구 on 11/2/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        List{
            HStack{
                Text("Hello, World!afwafafwag")
                Spacer()
                Image(systemName: "star")
                Text("5.55")
            }
            HStack{
                Text("Hello, Worlag")
                Spacer()
                Image(systemName: "star")
                Text("1.11")
            }
            HStack{
                Text("Hellwag")
                Spacer()
                Image(systemName: "star")
                Text("9.99")
            }
            HStack{
                Text("Hello, Woaag")
                Spacer()
                Image(systemName: "star")
                Text("1.25")
            }
            HStack{
                Text("Hello, Worlwag")
                Spacer()
                Image(systemName: "star")
                Text("1.25")
            }
            HStack{
                Text("Hellowfawafffwfafawgawafwag")
                Spacer()
                Image(systemName: "star")
                Text("1.25")
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
