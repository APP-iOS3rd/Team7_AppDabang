//
//  NavigationEx03.swift
//  DemoProject
//
//  Created by lkh on 11/1/23.
//

import SwiftUI

struct NavigationEx03: View {
    var body: some View {
        NavigationStack {
            List {
              
                NavigationLink("이동") {
                    NavigationEx03_SecondView().navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct NavigationEx03_SecondView: View {
    var body: some View {
        ZStack {
            Color(.blue)
        }
    }
}
#Preview {
    NavigationEx03()
}
