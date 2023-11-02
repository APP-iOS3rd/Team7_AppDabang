//
//  NavigationEx02.swift
//  DemoProject
//
//  Created by lkh on 11/1/23.
//

import SwiftUI

struct NavigationEx02: View {
    @State private var text: String = ""
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("전달할 데이터")) {
                    TextField("입력", text: $text)
                }
                
                NavigationLink("이동") {
                    NavigationEx02_SecondView(text: $text)
                }
            }
        }
    }
}

struct NavigationEx02_SecondView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField("입력", text: $text)
                .padding()
            
            Text(text)
        }
    }
}

#Preview {
    NavigationEx02()
}
