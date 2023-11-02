//
//  MyMoviesData.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import Foundation
import SwiftData

// MARK: - Swift Data

@Model
class DataItem: Identifiable, MovieProtocol {
    var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    var releaseDate: String
    var voteAverage: Double
    
    init(id: Int, title: String,
         overview: String, posterPath: String? = nil,
         releaseDate: String, voteAverage: Double) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }
}
