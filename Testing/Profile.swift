//
//  Profile.swift
//  Testing
//
//  Created by Artem on 15.01.2023.
//

import Foundation

enum SegmentType {
    case Main
    case WarmUp
    case CoolDown
}

enum SoundType {
    case Repeat
    case Begin
    case End
}

class Profile {
    var name = "Profile"
    var segments = [Segment]()
    var duration = 450.0
    
    init() {
        let segment = Segment(type: .Main)
        self.segments.append(segment)
    }
}

class Segment {
    var enabled: Bool
    var type: SegmentType
    var sounds = [Sound]()
    var duration: Double = 300
    
    init(type: SegmentType) {
        self.type = type
        self.enabled = true
    }
    
    func soundOfType(type: SoundType) -> Sound? {
        var result: Sound?
        
        for sound in sounds {
            if sound.type == type {
                result = sound
            }
        }
        return result
    }
}

class Sound {
    var enabled: Bool
    var type: SoundType
    var name: String = ""
    var iterations: Int = 0
    var timeInterval = 300.0
    
    init(type: SoundType) {
        self.type = type
        self.enabled = true
    }
}
