//
//  UILabel.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import UIKit

// MARK: Chain action
extension UILabel {
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        textColor = color
        return self
    }

    @discardableResult
    func numberOfLines(_ lines: Int) -> Self {
        numberOfLines = lines
        return self
    }
}
