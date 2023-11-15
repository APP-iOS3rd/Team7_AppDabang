//
//  LookLike++Bundle.swift
//  MentoringAPI
//
//  Created by phang on 11/9/23.
//

import Foundation

// clova api
extension Bundle {
    // id
    var ID: String {
        guard let file = self.path(forResource: "FaceInfo", ofType: "plist") else {
            return ""
        }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let id = resource["ID"] as? String else {
            fatalError("FaceInf.plist 에 ID 를 입력해주세요.")
        }
        return id
    }
    // secret
    var SECRET: String {
        guard let file = self.path(forResource: "FaceInfo", ofType: "plist") else {
            return ""
        }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let secret = resource["ID"] as? String else {
            fatalError("FaceInf.plist 에 SECRET 을 입력해주세요.")
        }
        return secret
    }
}
