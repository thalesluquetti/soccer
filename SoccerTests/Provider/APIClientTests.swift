//
//  APIClientTests.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import Combine
@testable import Soccer
import XCTest

final class APIClientTests: XCTestCase {
    var apiClient: APIClient!
    var mockSession: MockURLSession!
    var configuration: APIConfigurable!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        configuration = APIConfiguration()
        apiClient = APIClient(session: mockSession, configuration: configuration)
    }

    override func tearDown() {
        apiClient = nil
        mockSession = nil
        configuration = nil
        super.tearDown()
    }

    func testRequest_ShouldReturnValidResponse() {
        // Given
        let expectedStatusCode = 200
        let expectedData = "Mock data".data(using: .utf8)!
        mockSession.stubData = expectedData
        mockSession.stubResponse = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: expectedStatusCode, httpVersion: nil, headerFields: nil)

        let endpoint = MatchesEndpoint()

        // When
        let expectation = XCTestExpectation(description: "Request completion")
        apiClient.request(for: endpoint)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Expected success, but received failure with error: \(error)")
                }
            } receiveValue: { response in
                // Then
                XCTAssertEqual(response.statusCode, expectedStatusCode, "Response status code should match")
                XCTAssertEqual(response.data, expectedData, "Response data should match")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }

    func testRequest_ShouldReturnError() {
        // Given
        let expectedError = NSError(domain: "TestErrorDomain", code: 42, userInfo: nil)
        mockSession.stubError = expectedError

        let endpoint = MatchesEndpoint()

        // When
        let expectation = XCTestExpectation(description: "Request completion")
        apiClient.request(for: endpoint)
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail("Expected failure, but received success.")
                case .failure(let error):
                    // Then
                    XCTAssertEqual(error as NSError, expectedError, "Request should return the expected error")
                    expectation.fulfill()
                }
            } receiveValue: { _ in
                XCTFail("Expected failure, but received a value.")
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }
}
