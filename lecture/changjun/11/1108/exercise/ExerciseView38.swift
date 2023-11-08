//
//  ExerciseView38.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

enum Color38: String {
    case white, black, blue, teal, yellow,
        red, gray, green, orange, brown,
        cyan, indigo, mint, pink, purple
    
    var mainColor: Color {
        switch self {
        case .white:
            return Color.white
        case .black:
            return Color.black
        case .blue:
            return Color.blue
        case .teal:
            return Color.teal
        case .yellow:
            return Color.yellow
        case .red:
            return Color.red
        case .gray:
            return Color.gray
        case .green:
            return Color.green
        case .orange:
            return Color.orange
        case .brown:
            return Color.brown
        case .cyan:
            return Color.cyan
        case .indigo:
            return Color.indigo
        case .mint:
            return Color.mint
        case .pink:
            return Color.pink
        case .purple:
            return Color.purple
        }
    }
    var name: String {
        rawValue.capitalized
    }
    var accentColor: Color {
        switch self {
        case .black:
            return .white
        default:
            return .black
        }
    }
}

struct Item38: Identifiable, Hashable {
    let id = UUID()
    var categoryName: Color38
    var colors: [Color38] = [.white, .black, .blue, .teal, .yellow,
                             .red, .gray, .green, .orange, .brown,
                             .cyan, .indigo, .mint, .pink, .purple]
}

struct ExerciseView38: View {
    @State private var categories = [
        Item38(categoryName: Color38.white), Item38(categoryName: Color38.black),
        Item38(categoryName: Color38.blue), Item38(categoryName: Color38.teal),
        Item38(categoryName: Color38.yellow), Item38(categoryName: Color38.red),
        Item38(categoryName: Color38.gray), Item38(categoryName: Color38.green),
        Item38(categoryName: Color38.orange), Item38(categoryName: Color38.brown),
        Item38(categoryName: Color38.cyan), Item38(categoryName: Color38.indigo),
        Item38(categoryName: Color38.mint), Item38(categoryName: Color38.pink),
        Item38(categoryName: Color38.purple)
    ]
    @State private var selectedMode: Item38?
    @State private var selectedColor: Color38?
    
    var body: some View {
        NavigationSplitView() {
            List(categories, selection: $selectedMode) { mode in
                HStack {
                    Text(mode.categoryName.name)
                        .font(.title)
                        .foregroundStyle(mode.categoryName.accentColor)
                        .padding(5)
                        .frame(width: 250)
                        .background(mode.categoryName.mainColor)
                        .clipShape(.rect(cornerRadius: 15))
                }
                .padding(5)
                .tag(mode)
            }
            .navigationTitle("BG Color")
                    .multilineTextAlignment(.leading)
        } content: {
            if let selectedMode {
                List(selectedMode.colors, id: \.self,
                     selection: $selectedColor) { color in
                    HStack {
                        Rectangle()
                            .frame(width: 50)
                            .foregroundStyle(color.mainColor)
                            .clipShape(.rect(cornerRadius: 10))
                        Text(color.name)
                            .font(.title2)
                    }
                    .padding(5)
                    .tag(color)
                }
                .navigationTitle("Text Color")
            } else {
                Text("Select A Mode")
            }
        } detail: {
            if let selectedMode {
                ZStack {
                    selectedMode.categoryName.mainColor
                        .ignoresSafeArea()
                    if let selectedColor {
                        Text("Text Color")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(selectedColor.mainColor)
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Text Color")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                }
            } else {
                Text("Select \n\nMode \n& \nText Color")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ExerciseView38()
}
