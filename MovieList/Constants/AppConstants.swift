//
//  ApiConstants.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation

enum CellIdentifiers: String {
    case movieListCell = "MovieListCell"
}

enum SegueIdentifiers: String {
    case openPoster = "openPoster"
}

class AppConstants {
    static let baseURLString = "https://api.themoviedb.org/3"
    static let imagesURLString = "https://image.tmdb.org/t/p/original/"
    static let apiKey = "dd630220c96a4792b83f4d51f36378f1"
}
