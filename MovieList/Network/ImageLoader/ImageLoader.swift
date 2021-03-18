//
//  ImageLoader.swift
//  MovieList
//
//  Created by Andy Orphan on 15.03.2021.
//

import Foundation
import UIKit

class ImageLoader {
    
    static let shared = ImageLoader()
    private var cache = NSCache<NSString, UIImage>()
    private init() {}
    
    func clearCache() {
        cache.removeAllObjects()
    }
    
    func load(_ urlString: String, size: CGSize, _ completion: @escaping (UIImage?) -> Void) {
        if let image = cache.object(forKey: NSString(string: urlString)) {
            completion(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, let image = UIImage(data: data) {
                if let scaledImage = self?.getScaledImage(from: image, size: size) {
                    self?.cache.setObject(scaledImage, forKey: NSString(string: urlString))
                    completion(scaledImage)
                }
                return
            }
        }
        
        task.resume()
    }
    
    private func getScaledImage(from image: UIImage, size: CGSize) -> UIImage? {
        let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(imageRect.size, false, UIScreen.main.scale)
        image.draw(in: imageRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}
