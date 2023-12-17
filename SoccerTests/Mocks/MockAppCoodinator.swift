//
//  MockAppCoodinator.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

@testable import Soccer
import XCTest

final class MockCoordinator: AppCoordinatable {    
    var goToHomeCalled = false
    var startCalled = false

    func goToHome() {
        goToHomeCalled = true
    }
    
    func start() {
        startCalled = true
    }
}
