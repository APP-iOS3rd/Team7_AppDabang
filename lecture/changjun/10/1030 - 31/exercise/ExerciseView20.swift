//
//  ExerciseView20.swift
//  DemoProject2
//
//  Created by phang on 10/30/23.
//

import SwiftUI

struct ExerciseView20: View {
    let imageName = "cat"
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack(alignment:.center, spacing: 10) {
                    CatCircleImageView(imageName: imageName, imageSize: geo.size.width / 4)
                    GridThreeCatImageView(imageName: imageName, imageSize: geo.size.width / 4)
    //                HStack {
    //                    CatCircleImageView(imageName: imageName)
    //                    CatCircleImageView(imageName: imageName)
    //                    CatCircleImageView(imageName: imageName)
    //                }
    //                HStack {
    //                    CatCircleImageView(imageName: imageName)
    //                    CatCircleImageView(imageName: imageName)
    //                    CatCircleImageView(imageName: imageName)
    //                }
                }
                
                Spacer()
                
                HStack(alignment: .center) {
                    Button("BUTTON") { }
                        .buttonStyle(.borderedProminent)
                    Spacer()
                    Button("BUTTON") { }
                        .buttonStyle(.borderedProminent)
                    Spacer()
                    Button("BUTTON") { }
                        .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
    }
}

struct GridThreeCatImageView: View {
    let imageName: String
    let imageSize: CGFloat
    let column: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var data: [String] {  Array(repeating: imageName, count: 6) }
    
    var body: some View {
        LazyVGrid(columns: column) {
            ForEach(data.indices, id: \.self) {idx in
                VStack {
                    CatCircleImageView(imageName: data[idx], imageSize: imageSize)
                }
            }
        }
    }
}

struct CatCircleImageView: View {
    let imageName: String
    let imageSize: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: imageSize, height: imageSize)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 2)
            }
            .shadow(radius: 6)
    }
}


#Preview {
    ExerciseView20()
}
