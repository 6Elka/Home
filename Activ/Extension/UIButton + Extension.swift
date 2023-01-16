//
//  UIButton + Extension.swift
//  Activity
//
//  Created by Artem on 13.01.2023.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(title: String) {
        self.init()
        setTitle(title, for: .normal)
        layer.cornerRadius = 20
        backgroundColor = .orange
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
