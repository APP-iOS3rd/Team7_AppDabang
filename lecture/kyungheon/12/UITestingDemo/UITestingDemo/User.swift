//
//  User.swift
//  UITestingDemo
//
//  Created by lkh on 12/18/23.
//

import Foundation

// MARK: - User
// 유저 객체
class User: ObservableObject {
    @Published var isLoggedin = false
    @Published var username = ""
    @Published var password = ""
    
    // MARK: - login
    func login() -> Bool {
        guard username == "test" && password == "pass" else {
            return false
        }
        
        password = ""
        isLoggedin = true
        
        return true
    }
    
    // MARK: - logout
    // 버튼의 "Login" 텍스트가 "Logout"으로 업데이트(변경)되고 로그아웃이 실행
    func logout() {
        isLoggedin = false
        username = ""
    }
}
