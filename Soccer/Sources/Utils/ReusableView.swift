//
//  ReusableView.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import UIKit

// MARK: - ReusableView

//Extension to expedite the registration and reuse of cells.
protocol ReusableView: AnyObject {
    static var identifier: String { get }
    static func nib(bundle: Bundle) -> UINib
}

extension ReusableView where Self: UIView {
    static var identifier: String {
        String(describing: self)
    }

    static func nib(bundle: Bundle) -> UINib {
        UINib(nibName: Self.identifier, bundle: bundle)
    }
}
