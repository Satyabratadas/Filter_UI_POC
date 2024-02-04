//
//  Constant_file.swift
//  Filter_UI_Dummy_SwiftUI
//
//  Created by Satyabrata Das on 30/01/24.
//

import Foundation
import SwiftUI
import UIKit

extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow {
                    return window
                }
            }
        }
        return nil
    }
}

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
    static var screenWidth: CGFloat {
        guard let current = current else { return 0}
        return current.bounds.width
    }

    static var screenHeight: CGFloat {
        guard let current = current else { return 0}
        return current.bounds.height
    }

    static var screenOriginX: CGFloat {
        guard let current = current else { return 0}
        return current.bounds.origin.x
    }

    static var screenOriginY: CGFloat {
        guard let current = current else { return 0}
        return current.bounds.origin.y
    }
}

extension UIDeviceOrientation {

    static var isLandscapeModel: Bool {
        if let sceen = UIWindow.current?.windowScene {
            return sceen.interfaceOrientation.isLandscape
        }
        return false
    }
}

extension UIDevice {
    static var isIpad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
}


