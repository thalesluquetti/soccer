//
//  MatchesEndpointTests.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

@testable import Soccer
import XCTest

final class MatchesEndpointTests: XCTestCase {
    func testBuildRequest_ShouldReturnValidURLRequest() {
        // Given
        let endpoint = MatchesEndpoint()
        let baseURL = URL(string: "https://example.com")!

        // When
        do {
            let request = try endpoint.buildRequest(baseURL: baseURL)

            // Then
            XCTAssertEqual(request.url, baseURL, "URL should match baseURL")
            XCTAssertEqual(request.httpMethod, "GET", "HTTP method should be GET")
            XCTAssertEqual(request.allHTTPHeaderFields?[Constants.HeaderKeys.rapidApiKey], Constants.HeaderValues.soccerAPIKey, "API key header should match")
            XCTAssertEqual(request.allHTTPHeaderFields?[Constants.HeaderKeys.rapidApiHost], Constants.HeaderValues.soccerAPIHost, "API host header should match")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
