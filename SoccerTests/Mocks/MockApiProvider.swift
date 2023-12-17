//
//  MockApiProvider.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import Combine
@testable import Soccer
import XCTest

final class MockAPIProvider: APIProvider {
    var stubResult: Result<APIProviderResponse, Error> = .success(APIProviderResponse(statusCode: 200, data: Data(), request: URLRequest(url: URL(string: "https://example.com")!), response: HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!))
    
    func request(for request: Soccer.APIRequestBuilder) -> AnyPublisher<Soccer.APIProviderResponse, Error> {
        return Result.Publisher(stubResult)
            .eraseToAnyPublisher()
    }
}
