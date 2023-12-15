//
//  HomeViewModel.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 14/12/23.
//

import Combine
import Foundation

enum HomeViewState: Equatable {
    case loading
    case loaded
    case error(message: String)
}

//Chama usecase e configura estado da tela (loading, error, loaded)
final class HomeViewModel {
    // MARK: Lifecycle

    init(useCase: MatchesUseCase, coordinator: HomeCoordinatable) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    // MARK: Internal

    func fetchMatches() {
        state = .loading
        useCase.fetchMatches()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.state = .error(message: error.localizedDescription)
                }
            } receiveValue: { [weak self] matches in
                self?.matches = matches
                self?.state = .loaded
            }
            .store(in: &cancellables)
    }
    
    func goToNextScreen(entity: MatchEntity) {
        coordinator.goToMatchDetails(entity: entity)
    }
    
    // MARK: Private properties

    private let coordinator: HomeCoordinatable
    private let useCase: MatchesUseCase
    private var cancellables: Set<AnyCancellable> = []
    @Published private(set) var matches: [MatchEntity] = []
    @Published private(set) var state: HomeViewState = .loading
}
