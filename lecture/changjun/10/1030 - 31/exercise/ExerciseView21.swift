//
//  ExerciseView21.swift
//  DemoProject2
//
//  Created by phang on 10/30/23.
//

import SwiftUI

struct ExerciseView21: View {
    
    @State private var topImageName = "square.and.arrow.up"
    @State private var bottomImageName = "square.and.arrow.down"
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: topImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                  
            Spacer()
            
            HStack {
                Spacer()
                
                Button("UP") { 
                    if topImageName.hasSuffix("down") {
                        (topImageName, bottomImageName) = (bottomImageName, topImageName)
                    }
                }
                .padding(8)
                .frame(width: 100)
                .background(Color.black)
                .foregroundStyle(Color.white)
                .clipShape(.rect(cornerRadius: 5))
                
                Spacer()
                
                Button("DOWN") {
                    if topImageName.hasSuffix("up") {
                        (bottomImageName, topImageName) = (topImageName, bottomImageName)
                    }
                }
                .padding(8)
                .frame(width: 100)
                .background(Color.black)
                .foregroundStyle(Color.white)
                .clipShape(.rect(cornerRadius: 5))
                
                Spacer()
            }
            
            Spacer()
            
            Image(systemName: bottomImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
    }
}

#Preview {
    ExerciseView21()
}
