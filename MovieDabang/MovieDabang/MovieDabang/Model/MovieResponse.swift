//
//  MovieResponse.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - response

struct ResponseModel: Codable {
    let page: Int
    let result: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case result = "results"
    }
}
