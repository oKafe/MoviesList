//
//  Movie.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation

struct Movie: Codable {
    public let adult: Bool?
    public let backdropPath: String?
    public let genreIDS: [Int]?
    public let id: Int?
    public let originalLanguage, originalTitle, overview: String?
    public let popularity: Double?
    public let posterPath, releaseDate, title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func backdropFullPath() -> String? {
        return fullImagePath(backdropPath)
    }
    
    func posterFullPath() -> String? {
        return fullImagePath(posterPath)
    }
    
    private func fullImagePath(_ path: String?)  -> String? {
        guard let path = path else { return nil }
        return AppConstants.imagesURLString + path
    }
    
}
