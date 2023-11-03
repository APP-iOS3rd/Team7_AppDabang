//
//  MultiSelectionView.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct MultiSelectionView: View {
    struct Item: Identifiable {
        let id = UUID()
        let image: String
        let text: String
    }

    let items = [
        Item(image: "apple.logo", text: "Apple"),
        Item(image: "swift", text: "Swift"),
        Item(image: "swiftdata", text: "Xcode"),
        Item(image: "macpro.gen1.fill", text: "macOS"),
        Item(image: "iphone.gen2", text: "iOS")
    ]

    @State private var multiSelection = Set<UUID>()

    var body: some View {
        Text("\(multiSelection.count) selections")
            .font(.largeTitle)
            .padding()

        NavigationStack {

            List(items, selection: $multiSelection) { item in
                HStack {
                    Text(item.text)
                    Spacer()
                    Image(systemName: item.image)
                }
            }
            .navigationTitle("SwiftUI List Quiz")
            .toolbar { EditButton() }

        }
    }
}



#Preview {
    MultiSelectionView()
}
