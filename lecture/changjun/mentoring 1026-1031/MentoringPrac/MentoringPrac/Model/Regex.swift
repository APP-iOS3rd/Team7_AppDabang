//
//  Regex.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import Foundation

// MARK: - email, password REGEX

enum Constants {
    
    // email
    static let emailRegex = /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}/
    
    // 8 자 이상
    static let badPasswordRegex = /.{8,}/
    // 8 자 이상 & 숫자 1개 이상
    static let weakPasswordRegex = /^(?=.*[A-Za-z])(?=.*[0-9]).{8,50}/
    // 8 자 이상 & 숫자 1개 이상 & 특수문자 1개
    static let finePasswordRegex = /^(?=.*[A-Za-z])(?=.*[0-9])(?=(.*[!@#$%^&*()_+=-]){1})(?!.*[!@#$%^&*()_+=-].*[!@#$%^&*()_+=-]).{8,50}/
    // 8 자 이상 & 숫자 1개 이상 & 특수문자 2개 이상
    static let excellentPasswordRegex = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-].*[!@#$%^&*()_+=-]).{8,50}/
}
