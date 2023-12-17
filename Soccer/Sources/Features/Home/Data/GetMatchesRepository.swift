//
//  GetMatchesRepository.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Combine

//Calls the APIProvider and checks for API errors if necessary
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
