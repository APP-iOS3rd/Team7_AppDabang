//
//  LoginViewModel.swift
//  View_Practice01
//
//  Created by lkh on 11/6/23.
//

import SwiftUI
import Foundation

class LoginViewModel: ObservableObject {
    // 입력 관련
    @Published var user: User = User()
    
    // 각 필드 관련
    @Published var emailState: EmailState = .normal
    @Published var passwordState: PasswordState = .zero
    
    // 뷰 관련
    @Published var nextPage: Bool = false
    @Published var alret: Bool = false
    
    var heiperEmail: String {
        if emailState == .fail {
            return "이메일 양식 확인"
        } else {
            return "Heiper text"
        }
    }
    
    var heiperPassword: String {
        switch passwordState {
        case .zero:
            return "Heiper text"
        case .one:
            return "1단계 통과"
        case .two:
            return "2단계 통과"
        case .three:
            return "3단계 통과"
        case .four:
            return "4단계 통과"
        }
    }
    
    // 버튼 활성화
    var isBtnActive: Bool {
        if emailState == .success &&
            (passwordState == .two || 
             passwordState == .three || passwordState == .four) {
            return true
        } else { return false }
    }
    
    // 클리어
    var isLoginComplete: Bool {
        if user.userId == "ohtt@apple.com" && user.userPassword == "happyswift1!" {
            return true
        } else { return false }
    }
}
