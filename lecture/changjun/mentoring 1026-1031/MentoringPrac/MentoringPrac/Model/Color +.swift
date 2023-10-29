//
//  Color +.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import SwiftUI

// MARK: - Metoring 사용 컬러 HEX 코드

extension Color {
    static let mtBackground = Color(hex: "#CBDDFF")
    static let mtMainText = Color(hex: "#111111")
    static let mtRed = Color(hex: "#FF3B30")
    static let mtOrange = Color(hex: "#FF9F0A")
    static let mtGreen = Color(hex: "#35C95A")
    static let mtAccent = Color(hex: "#0F44FF")
    static let mtGray = Color(hex: "#9E9E9E")
}


// "#123456" or "123456" 핵스 코드(문자열) "#" 제거 / RGB값을 추출 / Color타입 인스턴스 생성
extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xff) / 255.0
        let g = Double((rgb >> 8) & 0xff) / 255.0
        let b = Double((rgb >> 0) & 0xff) / 255.0
        self.init(red: r, green:g, blue: b)
    }
    
}
