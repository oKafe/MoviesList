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
        ImageLoader.shared.load(urlString) { [weak self] result in
            DispatchQueue.main.async {
                RunLoop.current.perform(inModes: [RunLoop.Mode.default]) {
                    /*
                     UIKit виконає задачу, коли буде безпечно.
                     Це довелось зробити, тому що перший рендер (чи декодинг) зображень з API чомусь дуже довгий і це фрізить головну чергу (а саме скролл)
                     Скоріш за все це можна зробити красивіш, але я поки не мав часу на ресьорч
                     Якщо забрати RunLoop.current.perform(inModes: [RunLoop.Mode.default]), то скролл буде ривками, але швидше буде показувати зображення
                     */
                    self?.image = result
               }
            }
        }
    }
}
