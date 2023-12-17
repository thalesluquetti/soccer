//
//  MatchesEndpoint.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

struct MatchesEndpoint: APIRequestBuilder {
    // MARK: Internal

    func buildRequest(baseURL: URL) throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL)

        urlRequest.httpMethod = Constants.HttpMethods.get
        urlRequest.addValue(Constants.HeaderValues.soccerAPIKey, forHTTPHeaderField: Constants.HeaderKeys.rapidApiKey)
        urlRequest.addValue(Constants.HeaderValues.soccerAPIHost, forHTTPHeaderField: Constants.HeaderKeys.rapidApiHost)

        return urlRequest
    }
}
