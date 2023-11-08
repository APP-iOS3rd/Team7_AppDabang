//
//  NaviSpiltDemoView.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

/// 분할되는 네비를 볼거라, ipad or landscape 로 보길 - !
/**
 # NavigationSplitView

 와이드 디스플레이에서 멀티컬럼 기반의 내비게이션을 제공
 '''
 NavigationSplitView(columnVisibility: $columnVisibility) {
             // 사이드바 목록
         } content: {
             // 콘텐트 목록
         } detail: {
             // 디테일 뷰
         }
 '''
 */

// MARK: - Data
struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}

// MARK: - View
struct NaviSpiltDemoView: View {
    @State private var categories = [
        IconCategory(categoryName: "Folders", images:
                        ["questionmark.folder.ar",
                         "questionmark.folder",
                         "questionmark.folder.fill.ar",
                         "folder.fill.badge.gear",
                         "questionmark.folder.fill"]),
        IconCategory(categoryName: "Circles", images:
                        ["book.circle",
                         "books.vertical.circle",
                         "books.vertical.circle.fill",
                         "book.circle.fill",
                         "book.closed.circle"]),
        IconCategory(categoryName: "Clouds", images:
                        ["cloud.rain",
                         "cloud",
                         "cloud.drizzle.fill",
                         "cloud.fill",
                         "cloud.drizzle"])
    ]
    @State private var selectedCategory: IconCategory?
    @State private var selectedImage: String?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(categories, selection: $selectedCategory) { category in
                Text(category.categoryName)
                    .tag(category)
            }
        } content: {
            if let selectedCategory {
                List(selectedCategory.images,
                     id: \.self, selection: $selectedImage) { image in
                    HStack {
                        Image(systemName: image)
                        Text(image)
                    }
                    .tag(image)
                }
            } else {
                Text("Select a category")
            }
        } detail: {
            if let selectedImage {
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Select a image")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NaviSpiltDemoView()
}
