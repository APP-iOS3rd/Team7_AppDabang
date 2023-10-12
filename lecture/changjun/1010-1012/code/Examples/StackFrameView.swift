//
//  StackFrameView.swift
//  DemoProject2
//
//  Created by phang on 10/12/23.
//

import SwiftUI

struct StackFrameView: View {
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            Spacer()
            VStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            Spacer()
            Text("Bonjour, Phang")
        }
    }
}

#Preview {
    StackFrameView()
}
