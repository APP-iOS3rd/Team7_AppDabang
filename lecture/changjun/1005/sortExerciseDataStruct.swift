//
//  sortExerciseDataStruct.swift
//  prac2
//
//  Created by phang on 10/5/23.
//

import Foundation

// MARK: - sortExercise01_1

struct Song: CustomStringConvertible {
    var title: String
    var artist: String
    var play: Int
    
    init(title: String, artist: String, play: Int) {
        self.title = title
        self.artist = artist
        self.play = play
    }
    
    var description: String {
        return "play: \(play) | \(title) - \(artist)"
    }
}


// MARK: - sortExercise01_2

struct SortExerciseData: Codable {
    var songs: [Songs]
}

struct Songs: Codable, CustomStringConvertible {
    var title: String
    var artist: String
    var play: Int
    
    var description: String {
        return "play: \(play) | \(title) - \(artist)"
    }
}
        
