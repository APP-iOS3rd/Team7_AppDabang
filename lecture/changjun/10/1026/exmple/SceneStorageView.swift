//
//  SceneStorageView.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct SceneStorageView: View {
    
    @SceneStorage("mytext") private var editorText = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}
