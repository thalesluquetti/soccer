//
//  MatchDetailsViewModelTests.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

@testable import Soccer
import XCTest

final class MatchDetailsViewModelTests: XCTestCase {
    func testInit_ShouldSetEntity() {
        // Given
        let matchEntity = MatchEntity(title: "title", thumbnail: "", date: "", competition: CompetitionEntity(name: ""))

        // When
        let viewModel = MatchDetailsViewModel(entity: matchEntity)

        // Then
        XCTAssertEqual(viewModel.entity, matchEntity, "Init should set the entity")
    }
}
