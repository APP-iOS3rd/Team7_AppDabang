//
//  Login.swift
//  View_Practice01
//
//  Created by lkh on 11/6/23.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @Binding var isComplete: Bool
    
    let geometryWidth: CGFloat
    let geometryHeight: CGFloat
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Hello\nWorld !")
                    .font(.system(size: 50, weight: .semibold))
                    .padding()
                
                Email_Password(isComplete: $isComplete)
                    .environmentObject(viewModel)
                
                RectangleProduce()
                    .environmentObject(viewModel)
                
                Spacer()
                    .frame(width: geometryWidth / 4, height: geometryHeight / 2.5)
                
                CompleteButton(isComplete: $isComplete,
                               geometryWidth: geometryWidth,
                               geometryHeight: geometryHeight)
                    .environmentObject(viewModel)
                
                NavigationLink(
                    destination: Seach(),
                    isActive: $isComplete,
                    label: {
                        EmptyView()
                    }
                )
            }
            .frame(maxHeight: .infinity)
        }
    }
}
