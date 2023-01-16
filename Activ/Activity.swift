//
//  Activity.swift
//  Activity
//
//  Created by Artem on 12.01.2023.
//


import Foundation
import UIKit

class MyActivity: UIActivity {
    
    var item = [Any]()
    var title: String
    var image: UIImage?
    var action: ([Any]) -> Void
    
    init(title: String, image: UIImage, action: @escaping ([Any]) -> Void) {
        self.title = title
        self.image = image
        self.action = action
        super.init()
    }
    
    override var activityTitle: String? {
        return self.title
    }
    
    override var activityImage: UIImage? {
        return self.image
    }
    
    override class var activityCategory: UIActivity.Category {
        return UIActivity.Category.share
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType.init("myActivity")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.item = activityItems
    }
    
    override func perform() {
        action(item)
        activityDidFinish(true)
    }
    
    
}

