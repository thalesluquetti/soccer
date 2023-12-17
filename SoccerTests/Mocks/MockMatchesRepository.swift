//
//  MockMatchesRepository.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

import Combine
@testable import Soccer
import XCTest

final class MockMatchesRepository: MatchesRepository {
    var fetchMatchesResult: Result<[MatchDTO], Error> = .success([])

    func fetchMatches() -> AnyPublisher<[MatchDTO], Error> {
        return Result.Publisher(fetchMatchesResult)
            .eraseToAnyPublisher()
    }
}
