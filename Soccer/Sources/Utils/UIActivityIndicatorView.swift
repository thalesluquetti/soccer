//
//  UIActivityIndicatorView.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import UIKit

// MARK: Chain action
extension UIActivityIndicatorView {
    @discardableResult
    func hidesWhenStopped(_ hide: Bool) -> Self {
        hidesWhenStopped = hide
        return self
    }

    @discardableResult
    func color(_ color: UIColor) -> Self {
        self.color = color
        return self
    }
}
