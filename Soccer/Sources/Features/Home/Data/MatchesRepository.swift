//
//  MatchesRepository.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Combine

protocol MatchesRepository: AnyObject {
    func fetchMatches() -> AnyPublisher<[MatchDTO], Error>
}
