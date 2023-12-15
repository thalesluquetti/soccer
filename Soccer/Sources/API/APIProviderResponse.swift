//
//  APIProviderResponse.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

// MARK: - APIProviderResponse

final class APIProviderResponse: Equatable {
    // MARK: Lifecycle

    init(statusCode: Int, data: Data, request: URLRequest, response: HTTPURLResponse) {
        self.statusCode = statusCode
        self.data = data
        self.request = request
        self.response = response
    }

  // MARK: Internal

    let statusCode: Int
    let data: Data
    let request: URLRequest
    let response: HTTPURLResponse

    static func == (lhs: APIProviderResponse, rhs: APIProviderResponse) -> Bool {
        lhs.statusCode == rhs.statusCode
        && lhs.data == rhs.data
        && lhs.response == rhs.response
    }
}

extension APIProviderResponse {
    func extractError() -> APIProviderError? {
        let acceptableStatusCodes: Set = [200, 201, 202, 204, 304]

        if acceptableStatusCodes.contains(statusCode) {
            return nil
        }

        switch statusCode {
        case 401:
            return .missingApiKey

        case 403:
            return .accessDenied

        case 404:
            return .notFound

        default:
            return .remoteServer
        }
    }
}
