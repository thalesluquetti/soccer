//
//  AppCoordinator.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 14/12/23.
//

import UIKit

// MARK: - AppCoordinatable

protocol AppCoordinatable: Coordinatable {
    func goToHome()
}

// MARK: - AppCoordinator

//Pattern coordinator to extract navigation logic from the ViewModel.
final class AppCoordinator: AppCoordinatable {
    // MARK: Lifecycle

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    // MARK: Internal

    func start() {
        let viewModel = SplashViewModel(coordinator: self)
        let controller = SplashViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: false)
    }
    
    func goToHome() {
        let repository = GetMatchesRepository(apiProvider: APIClient(session: URLSession.shared, configuration: APIConfiguration()))
        let useCase = GetMatchesUseCase(matchesRepository: repository)
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, useCase: useCase)
        let homeViewModel = HomeViewModel(useCase: useCase, coordinator: homeCoordinator)
        let homeController = HomeViewController(viewModel: homeViewModel)
        navigationController.setViewControllers([homeController], animated: true)
    }

    // MARK: Private properties

    private let window: UIWindow
    private let navigationController: UINavigationController
}
