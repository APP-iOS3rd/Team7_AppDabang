//
//  NavSplitDemoView.swift
//  NavSplitDemo
//
//  Created by lkh on 11/8/23.
//

import SwiftUI

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}

struct NavSplitDemoView: View {

    @State private var categories = [
                IconCategory(categoryName: "Folders", images: ["questionmark.folder.ar",
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

    // 목록에서 현재 선택한 항목을 저장할 상태 변수 추가
    @State private var selectedCategory: IconCategory?
    @State private var selectedImage: String?
    // 앱이 처음 실행될 때부터 세 개의 열이 모두 표시 되도록
    // - NavigationSplitView의 columnVisibility: 초기화 매개변수에 NavigationSplitViewVisibility.all 전달
    @State private var columnVisibility = NavigationSplitViewVisibility.all

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            // 사이드바 열
            List(categories, selection: $selectedCategory) { category in
                Text(category.categoryName).tag(category)
            }
        } content: {
            // 콘텐츠 목록
            // 범주(사이드바)를 선택하지 않은 경우 빈 열이 표시되지 않기 위해 if-let 으로 상태 변수를 평가
            if let selectedCategory {
                List(selectedCategory.images, id: \.self, selection: $selectedImage) { image in
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
            // 디테일 열
            if let selectedImage {
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Select a image")
            }

        }  // nsv
        // 디테일 뷰가 가려지는 것을 방지
        // .balanced 균형잡힌 스타일을 적용
        .navigationSplitViewStyle(.balanced)

    }
}

#Preview {
    NavSplitDemoView()
}
