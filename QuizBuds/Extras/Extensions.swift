//
//  Extensions.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 16/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

extension UIViewController {
    // Convinience method for adding child view controllers
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    // Convinience method for removing child view controllers
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    // Convinience method for registereing the settings bundle
    func registerSettingsBundle() {
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
}

extension UIView {
    func cornerRadiusSmoothMask(radius: CGFloat) -> CAShapeLayer {
        let roundPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius)
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        return maskLayer
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(fromHex hex: String) {
        let hexNum = Int(strtoul(hex, nil, 16))
        self.init(
            red: (hexNum >> 16) & 0xFF,
            green: (hexNum >> 8) & 0xFF,
            blue: hexNum & 0xFF
        )
    }
}
