//
//  String+Date.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

extension String {
    func formatDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else { return self }
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let formattedString = dateFormatter.string(from: date)
        return formattedString
    }
}
