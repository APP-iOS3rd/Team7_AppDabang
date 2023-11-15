//
//  UserData.swift
//  MentoringLoginUI
//
//  Created by 조민식 on 2023/11/08.
//

import Foundation

struct UserData {
    var email: String
    var password: String
    var userName: String
    
    init(email: String, password: String, userName: String) {
        self.email = email
        self.password = password
        self.userName = userName
    }
}

extension UserData {
    static let ohtt: UserData = UserData(email: "ohtt@apple.com", password: "happyswift1!", userName: "오뜨")
}

struct Users {
    var users: [UserData] = [UserData.ohtt]
}


