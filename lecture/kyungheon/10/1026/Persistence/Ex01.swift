//
//  Ex01.swift
//  Persistence
//
//  Created by lkh on 10/26/23.
//

import SwiftUI

struct Ex01: View {
    var colors = ["Red", "Blue", "Black", "Green"]
    @State private var selectedColor = 0
    @AppStorage("myStore") var idx = 0

    var body: some View {
        NavigationView {
            VStack {
                Picker("원하는 색을 골라주세요", selection: $selectedColor) {
                    ForEach(0 ..< colors.count) {
                        Text(self.colors[$0])
                    }
                }
                
                .onChange(of: selectedColor) {
                    idx = $0
                }

                NavigationLink("넘어가기", destination: Ex01_navi(idx: $selectedColor))
            }
        }
        .onAppear {
            selectedColor = idx
        }
    }
}

struct Ex01_navi: View {
    @Binding var idx: Int

    var body: some View {
        NavigationView {
            ZStack {
                if idx == 0 {
                    Color(.red)
                } else if idx == 1 {
                    Color(.blue)
                } else if idx == 2 {
                    Color(.black)
                } else {
                    Color(.green)
                }
            }
        }
    }
}

#Preview {
    Ex01()
}
