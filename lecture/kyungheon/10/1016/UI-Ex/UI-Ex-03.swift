//
//  UI-Ex-03.swift
//  DemoProject
//
//  Created by lkh on 10/16/23.
//

import SwiftUI

struct UI_Ex_03: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Button("Button") {
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(10)
                
                Spacer()
                Button("Button") {
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height/2)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(10)
                
                Spacer()
                
                Button("Button") {
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(10)
            }
            
        }
    }
}

#Preview {
    UI_Ex_03()
}
