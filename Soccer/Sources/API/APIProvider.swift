//
//  APIProvider.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Combine

protocol APIProvider: AnyObject {
    func request(for request: APIRequestBuilder) -> AnyPublisher<APIProviderResponse, Error>
}
