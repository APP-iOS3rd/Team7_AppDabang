//
//  UserViewModel.swift
//  MentoringPrac
//
//  Created by phang on 11/1/23.
//

import Foundation

// MARK: - Logined UserData

class LoginUserData: ObservableObject {
    @Published var isLogin = false
    @Published var userName: String?
}
