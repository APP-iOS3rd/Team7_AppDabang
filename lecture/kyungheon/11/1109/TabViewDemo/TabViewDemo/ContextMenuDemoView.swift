//
//  ContextMenuDemoView.swift
//  TabViewDemo
//
//  Created by lkh on 11/9/23.
//

import SwiftUI

struct ContextMenuDemoView: View {

    @State private var foregroundColor: Color = .black
    @State private var backgroundColor: Color = .white

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

            } // contextMenu
    }
}

#Preview {
    ContextMenuDemoView()
}
