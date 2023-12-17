//
//  APIConfiguration.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

struct APIConfiguration: APIConfigurable {
    var baseURL: URL {
        guard
            let infoDictionary = Bundle.main.infoDictionary,
            let baseURLString = infoDictionary["BaseURL"] as? String,
            let baseUrl = URL(string: baseURLString)
        else {
            fatalError("Error on unwrap base url from plist")
        }
        return baseUrl
    }
}
