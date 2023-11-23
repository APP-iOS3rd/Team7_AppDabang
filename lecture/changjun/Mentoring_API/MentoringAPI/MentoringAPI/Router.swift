//
//  ViewModel.swift
//  MentoringAPI
//
//  Created by phang on 11/17/23.
//

import SwiftUI

enum Route: String, Hashable {
    case startingView
    case selectView
    case loadingView
    case resultView
}

class Router: ObservableObject {
    @Published var path = NavigationPath()
        
    func clear() {
        path = .init()
    }
}
