//
//  UI-Ex-02.swift
//  DemoProject
//
//  Created by lkh on 10/16/23.
//

import SwiftUI

struct UI_Ex_02: View {
    @State private var cnt: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: countView(cnt: $cnt)) {
                    Text("UI 예제 02")
                        
                }
            }
        }
    }
}

struct countView: View {
    @Binding var cnt: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(cnt)")
            
            Spacer()
//            Button(action: btnPressed, label: {Text("COUNT")
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: .infinity, height: .infinity)})
//                .modifier(btnCustom())
            
            Button(action: {
                self.cnt += 1
            }, label: {
                Text("COUNT")
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.indigo)
                            .frame(width: 380, height: 30)
                    )
                    .padding(.horizontal)
            })
        }
    }
    func btnPressed() {
        self.cnt += 1
    }
}

struct btnCustom2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(.indigo)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

#Preview {
    UI_Ex_02()
}
