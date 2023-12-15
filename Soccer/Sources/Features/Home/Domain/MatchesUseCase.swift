//
//  MatchesUseCase.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Combine

protocol MatchesUseCase: AnyObject {
    func fetchMatches() -> AnyPublisher<[MatchEntity], Error>
}
