//
//  MovieListsRouter.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation

enum MovieRouter: Router {
    
    case popular(_ page: Int)
    
    var urlString: String {
        switch self {
        case .popular(_):
            return "\(AppConstants.baseURLString)/movie/popular"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        switch self {
        case .popular(let page):
            return ["page": page,
                    "api_key": AppConstants.apiKey]
        }
    }
}
