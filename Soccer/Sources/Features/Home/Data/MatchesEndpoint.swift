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

        urlRequest.httpMethod = "GET"
        // Deveriam estar criptografadas, exemplo de ferramenta secrets do sourcery
        urlRequest.addValue("f2a3ed0ee1msha70faf1743460edp103586jsn62c4ed841e6e", forHTTPHeaderField: "X-RapidAPI-Key")
        urlRequest.addValue("free-football-soccer-videos.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")

        return urlRequest
    }
}
