//
//  MovieP.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import Foundation

protocol MovieProtocol {
    var id: Int { get }
    var title: String { get }
    var overview: String { get }
    var posterPath: String? { get }
    var releaseDate: String { get }
    var voteAverage: Double { get }
}
