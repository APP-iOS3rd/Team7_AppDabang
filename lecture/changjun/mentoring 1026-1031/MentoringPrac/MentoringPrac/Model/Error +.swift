//
//  Error +.swift
//  MentoringPrac
//
//  Created by phang on 10/29/23.
//

import Foundation

// MARK: - Login Error

enum LoginError: Error {
    case wrongEmail
    case wrongPassword
    
    
    var msg: String {
        switch self {
        case .wrongEmail:
            return """
                    잘못된 이메일입니다.
                    이메일 주소를 확인해주세요.
                    """
        case .wrongPassword:
            return """
                    잘못된 비밀번호입니다.
                    비밀번호를 확인해주세요.
                    """
        }
    }
}
