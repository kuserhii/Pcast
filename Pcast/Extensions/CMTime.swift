//
//  CMTime.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/21/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
    
        if CMTimeGetSeconds(self).isNaN {
            return "--:--:--"
        }
        
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = (totalSeconds / 60) % 60
        let hours = totalSeconds / 3600
        let timeFormatString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        return timeFormatString
    }
    
}
