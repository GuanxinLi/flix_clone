//
//  Movie.swift
//  flix_clone
//
//  Created by Guanxin Li and Godwin Pang on 2/28/18.
//  Copyright © 2018 Guanxin. All rights reserved.
//

import Foundation

class Movie {
    var title: String
    var backDropImageUrl: URL?
    var releaseDate: String
    var overView: String
    var posterUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        // NULL CHECK
        backDropImageUrl = dictionary["backdrop_path"] as? URL
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
        overView = dictionary["overview"] as? String ?? "No overview"
        posterUrl = dictionary["poster_path"] as? URL
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie]{
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        return movies
    }
}
