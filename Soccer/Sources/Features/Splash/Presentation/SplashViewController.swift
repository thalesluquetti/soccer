//
//  SplashViewController.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 14/12/23.
//

import Lottie
import UIKit

// MARK: - SplashViewController

final class SplashViewController: UIViewController {
    // MARK: Lifecycle

    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: Private properties

    private let viewModel: SplashViewModel
    private let animationView: AnimationView = {
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
}

extension SplashViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalToConstant: 300),
        ])

        setupLottieAnimation()
    }

    private func setupLottieAnimation() {
        if let animation = Animation.named("soccer_animation") {
            animationView.animation = animation
            animationView.loopMode = .playOnce
            animationView.play(completion: { [weak self] (finished) in
                if finished {
                    self?.viewModel.goToHome()
                }
            })
        }
    }
}
