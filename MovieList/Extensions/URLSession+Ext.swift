//
//  URLSession+Ext.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation


extension URLSession {
    func customCodableTask<T: Codable>(_ urlRequest: URLRequest, completion: @escaping (T?, Error?) -> ()) -> URLSessionDataTask {
        return self.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(result, nil)
            }
        }
    }
}
