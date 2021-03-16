//
//  Movies.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation

struct Movies: Codable {
    public let page: Int?
    public let results: [Movie]?
    public let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
