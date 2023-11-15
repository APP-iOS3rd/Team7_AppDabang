//
//  SeachView.swift
//  View_Practice01
//
//  Created by lkh on 11/12/23.
//

import SwiftUI

struct Seach: View {
    @ObservedObject var viewModel = SearchViewModel()
    @FocusState var focusedField: Field?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                TextField("검색어 입력해주세요", text: $viewModel.keyword)
                    .focused($focusedField, equals: .search)
                    .textFieldStyle(SearchTextFieldStyle(inputKeyword: $viewModel.keyword, focusField: focusedField)
                    )
                    .onSubmit {
                        Task {
                            await viewModel.loadSearchData()
                        }
                    }
                    .padding()
                
                
                List(viewModel.searchResult, id: \.id) { item in
                    Text(item.title)
                }
                .listStyle(PlainListStyle())
                
            }
        }
    }
}

#Preview {
    Seach()
}
