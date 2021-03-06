//
//  UIImage+Ext.swift
//  MovieList
//
//  Created by Andy Orphan on 16.03.2021.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from urlString: String?) {
        guard let urlString = urlString else { return }
        ImageLoader.shared.load(urlString, size: self.bounds.size) { [weak self] result in
            DispatchQueue.main.async {
                self?.image = result
                /*
                 UIKit виконає задачу, коли буде безпечно.
                 Це довелось зробити, тому що перший рендер (чи декодинг) зображень з API чомусь дуже довгий і це фрізить головну чергу (а саме скролл)
                 Якщо забрати RunLoop.current.perform(inModes: [RunLoop.Mode.default]), то скролл буде ривками, але швидше буде показувати зображення
             
                UPDATE: Пофіксив, роблячи нову картинку з UIGraphicsImageContext
                 */
//                RunLoop.current.perform(inModes: [RunLoop.Mode.default]) {
//                    self?.image = result
//                }
            }
            UIGraphicsEndImageContext()
        }
    }
}
