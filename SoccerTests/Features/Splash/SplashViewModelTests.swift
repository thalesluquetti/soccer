//
//  SplashViewModelTests.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

@testable import Soccer
import XCTest

final class SplashViewModelTests: XCTestCase {
    var mockCoordinator: MockCoordinator!

    override func setUp() {
        super.setUp()
        mockCoordinator = MockCoordinator()
    }

    override func tearDown() {
        mockCoordinator = nil
        super.tearDown()
    }


    func testGoToHome_ShouldCallCoordinator() {
        // Given
        let viewModel = SplashViewModel(coordinator: mockCoordinator)

        // When
        viewModel.goToHome()

        // Then
        XCTAssertTrue(mockCoordinator.goToHomeCalled, "goToHome should call the coordinator's goToHome method")
    }
}
