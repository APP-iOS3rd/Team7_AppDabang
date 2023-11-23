//
//  Errors.swift
//  MentoringAPI
//
//  Created by phang on 11/19/23.
//

import Foundation

// MARK: - 이미지 변환 및 네트워크 에러
enum Errors: Error {
    case invalidImageData
    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
}
