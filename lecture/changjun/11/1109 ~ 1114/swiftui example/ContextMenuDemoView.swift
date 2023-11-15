//
//  ContextMenuDemoView.swift
//  DemoProject2
//
//  Created by phang on 11/9/23.
//

import SwiftUI

struct ContextMenuDemoView: View {
    @State private var foregroundColor: Color = .black
    @State private var backgroundColor: Color = .white
    
    var body: some View {
        Text("Click!")
            .padding()
            .font(.largeTitle)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .contextMenu {
                Button {
                    self.foregroundColor = .black
                    self.backgroundColor = .white
                } label: {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                }
                Button {
                    self.foregroundColor = .white
                    self.backgroundColor = .black
                } label: {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                }
            }
    }
}

#Preview {
    ContextMenuDemoView()
}
