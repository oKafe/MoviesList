//
//  UILabel+Ext.swift
//  MovieList
//
//  Created by Andy Orphan on 16.03.2021.
//

import Foundation
import UIKit

extension UILabel {
    func setTextColor(_ percentage: Double) {
        let floatPercentage = CGFloat(percentage)
        let color = UIColor(hue: floatPercentage / 3.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        self.textColor = color
    }
}
