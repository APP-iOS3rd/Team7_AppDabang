//
//  Ex03.swift
//  Persistence
//
//  Created by lkh on 10/26/23.
//

import SwiftUI

struct Ex03: View {
    @State private var inputText = ""
    @AppStorage("myStore") var str = ""
    
    var body: some View {
        ZStack {
            Color(.gray)
            
            VStack {
                TextField("입력",text: $inputText)
                    .submitLabel(.done)
                    .onChange(of: inputText) {
                        str = $0
                    }
                
                Text(inputText)
            }
            .padding()
            .onAppear {
                inputText = str
            }
        }
    }
}

#Preview {
    Ex03()
}
