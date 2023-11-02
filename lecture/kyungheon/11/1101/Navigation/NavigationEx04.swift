//
//  NavigationEx04.swift
//  DemoProject
//
//  Created by lkh on 11/1/23.
//

import SwiftUI

struct NavigationEx04: View {
    @State private var text: String = ""
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("전달할 데이터")) {
                    TextField("입력", text: $text)
                }
                
                NavigationLink("이동") {
                    NavigationEx04_SecondView(text: $text)
                }
            }
        }
    }
}

struct NavigationEx04_SecondView: View {
    @Binding var text: String
    @State private var isEdit: Bool = false
    
    var body: some View {
        VStack {
            TextField("입력", text: $text)
                .textFieldStyle(.roundedBorder)
                .disabled(!isEdit)
                .padding()

        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isEdit ? "Done" : "Edit") {
                    isEdit.toggle()
                }
            }
        }
    }
}

#Preview {
    NavigationEx04()
}
