//
//  LoginViewModel.swift
//  MentoringPrac
//
//  Created by phang on 11/1/23.
//

import SwiftUI

// MARK: - Login 화면에서 사용되는 Data

class LoginData: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordHelperText: String = Texts.passwordHelperText.rawValue
    @Published var isValidEmail = false
    @Published var isValidPassword = false
    @Published var showPassword = false
    @Published var progressColorData: [Color] = Array(repeating: .mtGray, count: 4)
    @Published var isShowAlert = false
    @Published var alertMessage: String = ""
}
