//
//  MatchDetailsViewControllerTests.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 18/12/23.
//

@testable import Soccer
import XCTest
import SnapshotTesting

final class MatchDetailsViewControllerTests: XCTestCase {
    var sut: MatchDetailsViewController!
    var viewModel: MatchDetailsViewModel!

    override func setUp() {
        super.setUp()

        viewModel = MatchDetailsViewModel(entity: MatchEntity(title: "Title", thumbnail: "", date: "Date", competition: CompetitionEntity(name: "Championship")))
        sut = MatchDetailsViewController(viewModel: viewModel)

        sut.loadViewIfNeeded()
    }

    func testMatchDetailsViewControllerSnapshot() {
        XCTAssertNotNil(sut.view)

        assertSnapshot(
            matching: sut,
            as: .image,
            named: "details_controller",
            testName: "testMatchDetailsViewControllerSnapshot"
        )
    }
}
