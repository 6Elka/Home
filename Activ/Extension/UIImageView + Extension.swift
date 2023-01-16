//
//  UIImageView + Extension.swift
//  Activity
//
//  Created by Artem on 13.01.2023.
//

import Foundation
import UIKit

extension UIImageView {
    convenience init(contentMode: UIView.ContentMode) {
        self.init()
        layer.cornerRadius = 20
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
