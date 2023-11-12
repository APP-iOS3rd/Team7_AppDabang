//
//  Model.swift
//  View_Practice01
//
//  Created by lkh on 10/30/23.
//

import Foundation

enum Field {
    case email
    case password
    case search
}

enum EmailState {
    case normal
    case fail
    case success
}

enum PasswordState {
    case zero
    case one
    case two
    case three
    case four
}

struct User {
    var userId: String
    var userPassword: String
    
    init() {
        userId = ""
        userPassword = ""
    }
}


