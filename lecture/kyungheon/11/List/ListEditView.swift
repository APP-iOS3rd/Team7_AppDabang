//
//  ListEditView.swift
//  DemoProject
//
//  Created by lkh on 11/1/23.
//

import SwiftUI

struct ListEditView: View {

    struct Item: Identifiable {
        let id = UUID()
        let image: String
        let text: String
    }

    @State var items = [
        Item(image: "appplelogo", text: "Apple"),
        Item(image: "swift", text: "Swift"),
        Item(image: "xcode", text: "Xcode"),
        Item(image: "macos", text: "macOS"),
        Item(image: "ios", text: "iOS")
    ]

    var body: some View {
        Text("")
            .font(.largeTitle)
            .padding()
        NavigationStack {

            List {
                ForEach( items ) { item in
                    HStack {
                        Text("Item \(item.text)")
                    }
                }
                .onDelete(perform: { indexSet in
                    items.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    print("\(indices)")
                    items.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationTitle("SwiftUI List Quiz")
            .toolbar { EditButton() }

        }

    }}

#Preview {
    ListEditView()
}
