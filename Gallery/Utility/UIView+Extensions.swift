//
//  UIView+Extensions.swift
//  Gallery
//
//  Created by youme on 2023/02/04.
//

import SwiftUI

public extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
