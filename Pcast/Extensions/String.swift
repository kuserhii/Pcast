//
//  String.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/20/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self :
            self.replacingOccurrences(of: "http", with: "https")
    }
}
