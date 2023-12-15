//
//  SplashViewModel.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 14/12/23.
//

import UIKit

final class SplashViewModel {
    // MARK: Lifecycle

    init(coordinator: AppCoordinatable) {
        self.coordinator = coordinator
    }

    // MARK: Internal

    func goToHome() {
        coordinator.goToHome()
    }
    
    // MARK: Private properties

    private let coordinator: AppCoordinatable
}
