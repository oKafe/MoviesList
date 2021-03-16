//
//  PaginationManager.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation

class MovieListRequestsManager {
    
    private var page = 1
    private var isUpdating = false
    private var totalPages = 1
    
    func refreshMovies(completion: @escaping (Movies?, String?) -> ()) {
        self.page = 1
        getMovies(completion: completion)
    }
    
    func loadNextMovies(completion: @escaping (Movies?, String?) -> ()) {
        getMovies(completion: completion)
    }
    
    private func getMovies(completion: @escaping (Movies?, String?) -> ()) {
        guard self.totalPages >= self.page else {
            return
        }
        guard !self.isUpdating else {
            return
        }
        self.isUpdating = true
        let router = MovieRouter.popular(page)
        NetworkService.getMovies(router: router) { (movies, error) in
            if let movies = movies {
                self.page = (movies.page ?? self.page) + 1
                self.totalPages = movies.totalPages ?? self.page
                completion(movies, nil)
            } else {
                completion(nil, error?.localizedDescription)
            }
            self.isUpdating = false
        }
    }
    
}
