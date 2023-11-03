//
//  ViewModel.swift
//  View_Practice01
//
//  Created by lkh on 10/30/23.
//

import SwiftUI
import Foundation

class LoginViewModel: ObservableObject {
    @Published var user: Login = Login()
    @Published var heiperEmail: String = "Heiper text"
    @Published var heiperPassword: String = "Heiper text"
    @Published var processPassword: [Bool] = Array(repeating: false, count: 4)
    
    @Published var emailState: Int = 0 // 0: 일반, 1: 이메일 에러, 2: 완료
    @Published var nextPage: Bool = false
    @Published var alret: Bool = false
    
    // MARK: - 이메일 관련
    func isValidEmail() { // 유효성 검사
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailText = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            
        let ret = emailText.evaluate(with: user.userId)
        
        if (ret) {
            emailState = 2
            heiperEmail = ""
        }
        else {
            emailState = 1
            heiperEmail = "이메일을 올바르게 입력해주세요."
        }
    }
    
    func emailFieldColor() -> Color {
        emailState == 1 ? .red : .black
    }

    // MARK: - 패스워드 관련
    func isValidPassword() {
        processPassword[0] = user.userPassword.count >= 8 ? true : false
        processPassword[1] = processPassword[0] && isHaveDigit() ? true : false
        processPassword[2] = processPassword[1] && isHaveSpecial(1) ? true : false
        processPassword[3] = processPassword[2] && isHaveSpecial(2) ? true : false
        
        func isHaveDigit() -> Bool {
            user.userPassword.filter { $0.isNumber}.count >= 1
        }
        
        func isHaveSpecial(_ leng: Int) -> Bool {
            user.userPassword.filter { "!@#$%^&*()_+=-".contains($0)}.count >= leng
        }
    }
    
    func passwordColor(_ idx: Int) -> Color {
        switch idx {
        case 0:
            return processPassword[0] ? .red : Color(.gray)
        case 1:
            return processPassword[1] ? .orange : Color(.gray)
        case 2:
            return processPassword[2] ? .yellow : Color(.gray)
        case 3:
            return processPassword[3] ? .green : Color(.gray)
        default:
            return Color(.gray)
        }
    }
    
    // MARK: - 넥스트 버튼 관련
    func nextBtnOnOff() -> Bool {
        return emailState == 2 && processPassword[1] ? true : false
    }
    
    func isPossibleNext() -> Bool {
        //user.userId != masterId || user.userPassword != masterPw
        if user.userId != masterId || user.userPassword != masterPw {
            return false
        }
        return true
    }
}

