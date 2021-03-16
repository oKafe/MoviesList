//
//  Networking.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation

final class Networking { //для того, щоб було легко змінювати, наприклад, URLSesion на Alamofire
    static func task<T: Codable>(router: Router, completion: @escaping (T?, Error?) -> ()) {
        guard let request = router.asURLRequest() else {
            completion(nil, nil)
            return
        }
        let task = URLSession.shared.customCodableTask(request, completion: completion)
        task.resume()
    }
}
