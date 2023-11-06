//
//  LoginViewModel+Email.swift
//  View_Practice01
//
//  Created by lkh on 11/6/23.
//

import SwiftUI

// MARK: - 이메일 관련
extension LoginViewModel {
    var updateEmailState: EmailState {
        if isValidEmail() {
            return .success
        } else {
            return .fail
        }
    }
    
    // 유효성 검사
    private func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailText = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        return emailText.evaluate(with: user.userId)
    }
}

// MARK: - 패스워드 관련
extension LoginViewModel {
    var rectangColor: (Color, Color, Color, Color) {
        switch passwordState {
        case .zero:
            (Color(.gray), Color(.gray), Color(.gray), Color(.gray))
        case .one:
            (Color(.red), Color(.gray), Color(.gray), Color(.gray))
        case .two:
            (Color(.red), Color(.orange), Color(.gray), Color(.gray))
        case .three:
            (Color(.red), Color(.orange), Color(.yellow), Color(.gray))
        case .four:
            (Color(.red), Color(.orange), Color(.yellow), Color(.green))
        }
    }
    
    var updatePasswordState: PasswordState {
        get {
            let firstStep = user.userPassword.count >= 8 ? true : false
            let twoStep = user.userPassword.filter { $0.isNumber }.count >= 1 ? true : false
            let specialCharCount = user.userPassword.filter { "!@#$%^&*()_+=-".contains($0) }.count
            
            if firstStep && twoStep && specialCharCount >= 2 { // 4
                return .four
            }
            
            if firstStep && twoStep && specialCharCount == 1 { // 3
                return .three
            }
            
            if firstStep && twoStep { // 2
                return .two
            }
            
            if firstStep { // 1
                return .one
            }
            
            return .zero
        }
    }
    
}
