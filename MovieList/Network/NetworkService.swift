//
//  NetworkService.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation


class NetworkService {
    
    static func getMovies(router: Router, completion: @escaping (Movies?, Error?) -> ()) {
        Networking.task(router: router, completion: completion)
    }
    
}
