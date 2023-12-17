//
//  MockMatchesUseCase.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import Combine
@testable import Soccer
import XCTest

final class MockMatchesUseCase: MatchesUseCase {
    var fetchMatchesResult: Result<[MatchEntity], Error> = .success([])

    func fetchMatches() -> AnyPublisher<[MatchEntity], Error> {
        Result.Publisher(fetchMatchesResult)
            .eraseToAnyPublisher()
    }
}
