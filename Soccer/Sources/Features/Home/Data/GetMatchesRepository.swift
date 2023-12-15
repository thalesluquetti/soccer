//
//  GetMatchesRepository.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Combine

//Chama API e verifica erros de API caso necessario
final class GetMatchesRepository: MatchesRepository {
    // MARK: Lifecycle
    
    init(apiProvider: APIProvider) {
      self.apiProvider = apiProvider
    }
    
    // MARK: Internal
    
    func fetchMatches() -> AnyPublisher<[MatchDTO], Error> {
        return apiProvider.request(for: MatchesEndpoint())
          .tryMap { try MatchesMapper.transform($0) }
          .eraseToAnyPublisher()
    }
    
    // MARK: Private properties

    private let apiProvider: APIProvider
}
