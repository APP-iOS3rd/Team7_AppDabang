//
//  SelectView.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct SelectView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .onAppear {
            TestViewController().viewDidLoad()
        }
    }
}

#Preview {
    SelectView()
}
