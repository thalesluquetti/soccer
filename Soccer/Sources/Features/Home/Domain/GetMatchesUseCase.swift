//
//  GetMatchesUseCase.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Combine

//Chama repository e verifica regras de negocio caso necessario e cuida da transformação de DTOs
final class GetMatchesUseCase: MatchesUseCase {
    // MARK: Lifecycle
    
    init(matchesRepository: MatchesRepository) {
        self.matchesRepository = matchesRepository
    }

    // MARK: Internal
    
    func fetchMatches() -> AnyPublisher<[MatchEntity], Error> {
        return matchesRepository.fetchMatches()
            .map { matches in
                return matches.map { $0.toEntity() }
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: Private properties
    
    private let matchesRepository: MatchesRepository
}
