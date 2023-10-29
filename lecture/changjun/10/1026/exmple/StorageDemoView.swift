//
//  StorageDemoView.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct StorageDemoView: View {
    
    var body: some View {
        TabView {
            
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorageView")
                }
            
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorageView")
                }
        }
    }
}

#Preview {
    StorageDemoView()
}
