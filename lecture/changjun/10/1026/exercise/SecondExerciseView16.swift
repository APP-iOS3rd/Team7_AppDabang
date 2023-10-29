//
//  SecondExerciseView16.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct SecondExerciseView16: View {
    
    @EnvironmentObject var myColor: ColorThemeData
    
    var body: some View {
        ZStack {
            myColor.color.ignoresSafeArea(.all)
            
            VStack {
                Text("Second View")
            }
        }
    }
}

#Preview {
    SecondExerciseView16().environmentObject(ColorThemeData())
}
