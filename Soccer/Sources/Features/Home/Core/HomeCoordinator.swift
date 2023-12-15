//
//  HomeCoordinator.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 14/12/23.
//

import UIKit

// MARK: - HomeCoordinatable

protocol HomeCoordinatable: Coordinatable {
    func goToMatchDetails(entity: MatchEntity)
}

// MARK: - HomeCoordinator

final class HomeCoordinator: HomeCoordinatable {
    // MARK: Lifecycle

    init(navigationController: UINavigationController, useCase: MatchesUseCase) {
        self.navigationController = navigationController
        self.useCase = useCase
    }

    // MARK: Internal

    func start() {
        let viewModel = HomeViewModel(useCase: useCase, coordinator: self)
        let controller = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToMatchDetails(entity: MatchEntity) {
        let viewModel = MatchDetailsViewModel(entity: entity)
        let controller = MatchDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }

    // MARK: Private properties

    private let navigationController: UINavigationController
    private let useCase: MatchesUseCase
}
