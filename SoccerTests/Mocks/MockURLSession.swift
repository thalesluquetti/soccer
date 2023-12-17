//
//  MockURLSession.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

@testable import Soccer
import XCTest

final class MockURLSession: URLSession {
    var stubData: Data?
    var stubResponse: HTTPURLResponse?
    var stubError: Error?

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let data = stubData
        let response = stubResponse
        let error = stubError

        return MockURLSessionDataTask {
            completionHandler(data, response, error)
        }
    }
}
