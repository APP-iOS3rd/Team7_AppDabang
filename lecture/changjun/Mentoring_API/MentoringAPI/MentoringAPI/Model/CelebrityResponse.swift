//
//  CelebrityResponse.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI

// MARK: - response
struct CelebrityResponse {
    enum CodingKeys: String, CodingKey {
      case info
      case faces
    }
    enum InfoKeys: String, CodingKey {
        case size
        case faceCount
    }
    enum SizeKeys: String, CodingKey {
        case width
        case height
    }
    let widthSize: Int
    let heightSize: Int
    let faceCount: Int
    let faces: [Face]
}

// MARK: - response + nested container -> decode
extension CelebrityResponse: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        faces = try container.decode([Face].self, forKey: .faces)
        let info = try container.nestedContainer(keyedBy: InfoKeys.self, forKey: .info)
        faceCount = try info.decode(Int.self, forKey: .faceCount)
        let size = try info.nestedContainer(keyedBy: SizeKeys.self, forKey: .size)
        widthSize = try size.decode(Int.self, forKey: .width)
        heightSize = try size.decode(Int.self, forKey: .height)
    }
}

// MARK: - face
struct Face {
    enum CodingKeys: String, CodingKey {
        case celebrity
    }
    enum CelebrityKeys: String, CodingKey {
        case value
        case confidence
    }
    let celebrityValue: String
    let celebrityConfidence: Double
}

// MARK: - face + nested container -> decode
extension Face: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let celebrity = try container.nestedContainer(keyedBy: CelebrityKeys.self, forKey: .celebrity)
        celebrityValue = try celebrity.decode(String.self, forKey: .value)
        celebrityConfidence = try celebrity.decode(Double.self, forKey: .confidence)
    }
}
