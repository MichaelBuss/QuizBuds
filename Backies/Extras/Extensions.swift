//
//  Extensions.swift
//  Backies
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
}

extension UIView {
    func cornerRadiusSmoothMask(radius: CGFloat) -> CAShapeLayer {
        let roundPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius)
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        return maskLayer
    }
}
