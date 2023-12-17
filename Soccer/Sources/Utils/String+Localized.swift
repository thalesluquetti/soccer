//
//  String+Localized.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: String())
    }
}
