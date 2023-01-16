//
//  UITextField + Extension.swift
//  Activity
//
//  Created by Artem on 13.01.2023.
//

import Foundation
import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        layer.cornerRadius = 10
        textColor = .black
        backgroundColor = .lightGray
        self.placeholder = placeholder
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
