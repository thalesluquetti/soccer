//
//  MockHomeCoordinator.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

@testable import Soccer
import XCTest

final class MockHomeCoordinator: HomeCoordinatable {
    var goToMatchDetailsCalled = false
    var startCalled = false
    var goToMatchDetailsEntity: MatchEntity?

    func goToMatchDetails(entity: MatchEntity) {
        goToMatchDetailsCalled = true
        goToMatchDetailsEntity = entity
    }
    
    func start() {
        startCalled = true
    }
}
