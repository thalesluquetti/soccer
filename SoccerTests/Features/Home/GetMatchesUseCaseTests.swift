//
//  GetMatchesUseCaseTests.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import Combine
@testable import Soccer
import XCTest

final class GetMatchesUseCaseTests: XCTestCase {
    var useCase: GetMatchesUseCase!
    var mockRepository: MockMatchesRepository!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockRepository = MockMatchesRepository()
        useCase = GetMatchesUseCase(matchesRepository: mockRepository)
    }

    override func tearDown() {
        useCase = nil
        mockRepository = nil
        cancellables.removeAll()
        super.tearDown()
    }

    func testFetchMatches_ShouldReturnSuccessResult() {
        // Given
        let expectedMatches = [MatchDTO(title: "title", thumbnail: "", date: "", competition: CompetitionDTO(name: ""))]
        let expectedResult: Result<[MatchDTO], Error> = .success(expectedMatches)

        // When
        mockRepository.fetchMatchesResult = expectedResult

        // Then
        let expectation = XCTestExpectation(description: "fetchMatches completion")
        useCase.fetchMatches()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Expected success, but received failure with error: \(error)")
                }
            } receiveValue: { matches in
                XCTAssertEqual(matches.count, expectedMatches.count, "fetchMatches should return the expected number of matches")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchMatches_ShouldReturnFailureResult() {
        // Given
        let expectedError = NSError(domain: "TestErrorDomain", code: 42, userInfo: nil)
        let expectedResult: Result<[MatchDTO], Error> = .failure(expectedError)

        // When
        mockRepository.fetchMatchesResult = expectedResult

        // Then
        let expectation = XCTestExpectation(description: "fetchMatches completion")
        useCase.fetchMatches()
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail("Expected failure, but received success.")
                case .failure(let error):
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
