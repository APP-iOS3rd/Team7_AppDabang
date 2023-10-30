//
//  ContentView.swift
//  View_Practice01
//
//  Created by lkh on 10/30/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        LoginView()
            .environmentObject(LoginViewModel())
    }
}

#Preview {
    ContentView()
}
