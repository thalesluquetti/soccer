//
//  APIRequestBuilder.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

protocol APIRequestBuilder {
    func buildRequest(baseURL: URL) throws -> URLRequest
}
