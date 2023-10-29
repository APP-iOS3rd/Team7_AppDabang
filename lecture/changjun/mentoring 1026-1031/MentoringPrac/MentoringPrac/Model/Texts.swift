//
//  Texts.swift
//  MentoringPrac
//
//  Created by phang on 10/29/23.
//

import Foundation

// MARK: - 텍스트 정보

enum Texts: String {    
    case loginGreetings = "Hello \nAppDabang !"
    case login = "로그인"
    case email = "이메일"
    case password = "비밀번호"
    case emailPlaceHolder = "이메일을 입력해주세요."
    case passwordPlaceHolder = "비밀번호를 입력해주세요."
    case emailHelperText = "이메일을 올바르게 입력해주세요."
    case passwordHelperText = "Unable - 8자 이상"
    case passwordHelperText1 = "Unable - 문자 + 숫자 + 특수문자 추천"
    case passwordHelperText2 = "Weak - 특수문자 추천"
    case passwordHelperText3 = "Fine - 특수문자 추가 추천"
    case passwordHelperText4 = "Excellent"
    
    var size: CGFloat {
        switch self {
        case .loginGreetings:
            return 40
        case .login:
            return 20
        case .emailPlaceHolder, .passwordPlaceHolder:
            return 16
        default:
            return 14
        }
    }
}
