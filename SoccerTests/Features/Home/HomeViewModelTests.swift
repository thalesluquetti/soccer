//
//  HomeViewModelTests.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import Combine
@testable import Soccer
import XCTest

final class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockUseCase: MockMatchesUseCase!
    var mockCoordinator: MockHomeCoordinator!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockUseCase = MockMatchesUseCase()
        mockCoordinator = MockHomeCoordinator()
        viewModel = HomeViewModel(useCase: mockUseCase, coordinator: mockCoordinator)
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        mockCoordinator = nil
        cancellables.removeAll()
        super.tearDown()
    }

    func testFetchMatches_ShouldUpdateMatchesAndStateOnSuccess() {
            // Given
            let expectedMatches = [MatchEntity(title: "title", thumbnail: "", date: "", competition: CompetitionEntity(name: ""))]
            mockUseCase.fetchMatchesResult = .success(expectedMatches)

            // When
            viewModel.fetchMatches()

            // Then
            XCTAssertEqual(viewModel.state, .loading, "fetchMatches should set state to loading")

            let expectation = XCTestExpectation(description: "fetchMatches completion")
            viewModel.$state
                .sink { state in
                    if state == .loaded {
                        XCTAssertEqual(self.viewModel.matches, expectedMatches, "fetchMatches should update matches on success")
                        expectation.fulfill()
                    }
                }
                .store(in: &cancellables)

            wait(for: [expectation], timeout: 2)
        }

        func testFetchMatches_ShouldUpdateStateOnError() {
            // Given
            let expectedError = NSError(domain: "TestErrorDomain", code: 42, userInfo: nil)
            mockUseCase.fetchMatchesResult = .failure(expectedError)

            // When
            viewModel.fetchMatches()

            // Then
            XCTAssertEqual(viewModel.state, .loading, "fetchMatches should set state to loading")

            let expectation = XCTestExpectation(description: "fetchMatches completion")
            viewModel.$state
                .sink { state in
                    if case .error(let message) = state {
                        XCTAssertEqual(message, expectedError.localizedDescription, "fetchMatches should update state with an error on failure")
                        expectation.fulfill()
                    }
                }
                .store(in: &cancellables)

            wait(for: [expectation], timeout: 2)
        }

    func testGoToNextScreen_ShouldCallCoordinatorWithCorrectEntity() {
        // Given
        let expectedEntity = MatchEntity(title: "title", thumbnail: "", date: "", competition: CompetitionEntity(name: ""))

        // When
        viewModel.goToNextScreen(entity: expectedEntity)

        // Then
        XCTAssertTrue(mockCoordinator.goToMatchDetailsCalled, "goToNextScreen should call coordinator's goToMatchDetails method")
        XCTAssertEqual(mockCoordinator.goToMatchDetailsEntity, expectedEntity, "goToNextScreen should call coordinator with correct entity")
    }
}
