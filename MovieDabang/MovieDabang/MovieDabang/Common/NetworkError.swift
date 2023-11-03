//
//  NetworkError.swift
//  MovieDabang
//
//  Created by phang on 11/3/23.
//

import Foundation

// MARK: - 데이터 에러

enum NetworkError: Error {
    case invalidURLString
    case invalidServerResponse
}
