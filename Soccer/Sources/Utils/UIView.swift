//
//  UIView.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}

// MARK: Chain action
extension UIView {
    @discardableResult
    func enableAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    func contentMode(_ mode: ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @discardableResult
    func background(color: UIColor) -> Self {
        backgroundColor = color
        return self
    }

    @discardableResult
    func clipToBounds(_ clipToBounds: Bool) -> Self {
        clipsToBounds = clipToBounds
        return self
    }

    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func parent<T: UIView>(_ parent: T) -> Self {
        parent.addSubview(self)
        return self
    }
    
    @discardableResult
    func fillParent(insets: UIEdgeInsets = UIEdgeInsets.zero) -> Self {
        guard let superview = superview else { return self }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom),
        ])
        return self
    }
    
    @discardableResult
    func size(height: CGFloat? = nil, width: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        if let height = height {
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: height),
            ])
        }

        if let width = width {
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: width),
            ])
        }

        return self
    }
}
