//
//  AppDabangUserData.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import Foundation

// MARK: - User Data

struct AppDabangUsers {
    var users: [AppDabangUser] = [AppDabangUser.ohtt, AppDabangUser.phang]
}

struct AppDabangUser: Identifiable {
    let id: UUID
    let email: String
    var password: String
    var userName: String
    
    init(id: UUID = UUID(), email: String, password: String, userName: String = UUID().description) {
        self.id = id
        self.email = email
        self.password = password
        self.userName = userName
    }
}
