//
//  GetMatchesRepositoryTests.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import Combine
@testable import Soccer
import XCTest

final class GetMatchesRepositoryTests: XCTestCase {
    var repository: GetMatchesRepository!
    var mockAPIProvider: MockAPIProvider!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockAPIProvider = MockAPIProvider()
        repository = GetMatchesRepository(apiProvider: mockAPIProvider)
    }

    override func tearDown() {
        repository = nil
        mockAPIProvider = nil
        cancellables.removeAll()
        super.tearDown()
    }

    func testFetchMatches_ShouldReturnMatches() {
        // Given
        let expectedMatches = [MatchDTO(title: "title", thumbnail: "", date: "", competition: CompetitionDTO(name: ""))]
        mockAPIProvider.stubResult = .success(APIProviderResponse(statusCode: 200, data: try! JSONEncoder().encode(expectedMatches), request: URLRequest(url: URL(string: "https://example.com")!), response: HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!))

        // When
        let expectation = XCTestExpectation(description: "fetchMatches completion")
        repository.fetchMatches()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Expected success, but received failure with error: \(error)")
                }
            } receiveValue: { matches in
                // Then
                XCTAssertEqual(matches, expectedMatches, "fetchMatches should return the expected matches")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchMatches_ShouldReturnError() {
        // Given
        let expectedError = NSError(domain: "TestErrorDomain", code: 42, userInfo: nil)
        mockAPIProvider.stubResult = .failure(expectedError)

        // When
        let expectation = XCTestExpectation(description: "fetchMatches completion")
        repository.fetchMatches()
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail("Expected failure, but received success.")
                case .failure(let error):
                    // Then
                    XCTAssertEqual(error as NSError, expectedError, "fetchMatches should return the expected error")
                    expectation.fulfill()
                }
            } receiveValue: { _ in
                XCTFail("Expected failure, but received a value.")
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }
}
