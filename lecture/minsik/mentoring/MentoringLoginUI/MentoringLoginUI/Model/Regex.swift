//
//  Regex.swift
//  MentoringLoginUI
//
//  Created by 조민식 on 2023/11/08.
//

import Foundation
enum Regex {
    
    static let badRegex = /.{8,}/

    static let weakRegex = /^(?=.*[A-Za-z])(?=.*[0-9]).{8,50}/
   
    static let fineRegex = /^(?=.*[A-Za-z])(?=.*[0-9])(?=(.*[!@#$%^&*()_+=-]){1})(?!.*[!@#$%^&*()_+=-].*[!@#$%^&*()_+=-]).{8,50}/

    static let excellentRegex = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-].*[!@#$%^&*()_+=-]).{8,50}/
}
