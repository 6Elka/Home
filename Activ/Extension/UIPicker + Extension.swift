//
//  UIPicker + Extension.swift
//  Activity
//
//  Created by Artem on 13.01.2023.
//

import Foundation
import UIKit

extension UIPickerView {
    convenience init(background: UIColor?) {
        self.init()
        self.backgroundColor = background
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
}
