//
//  UIApplication.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/24/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import UIKit

extension UIApplication {
    static func mainTabBarController() -> MainTabBarController? {
        return shared.keyWindow?.rootViewController as? MainTabBarController
    }
}
