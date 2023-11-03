//
//  Bundle + .swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import Foundation

// MARK: - KEY

extension Bundle {
    var tmdbAPIKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "TMDB_KEY", ofType: "plist") else {
                fatalError("Couldn't find file 'TMDB_KEY.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            
            guard let value = plist?.object(forKey: "TMDB_KEY") as? String else {
                fatalError("Couldn't find key 'TMDB_KEY' in 'TMDB_KEY.plist'.")
            }
            return value
        }
    }
}
