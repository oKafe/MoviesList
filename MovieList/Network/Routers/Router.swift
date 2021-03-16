//
//  Router.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol Router {
    typealias Parameters = [String: Any]
    var urlString: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    func asURLRequest() -> URLRequest?
}


extension Router {
    func asURLRequest() -> URLRequest? {
        guard var components = URLComponents(string: urlString) else { return nil }
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: "\(value)")
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        return request
    }
}
