//
//  MatchDetailsViewController.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import UIKit

final class MatchDetailsViewController: UIViewController {
    // MARK: Lifecycle

    init(viewModel: MatchDetailsViewModel) {
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

    private let viewModel: MatchDetailsViewModel
    private lazy var titleLabel: UILabel = {
        UILabel()
            .text(viewModel.entity.title)
            .alignment(.center)
            .numberOfLines(0)
            .enableAutoLayout()
    }()
    private lazy var dateLabel: UILabel = {
        UILabel()
            .text(viewModel.entity.date)
            .alignment(.center)
            .numberOfLines(0)
            .enableAutoLayout()
    }()
    private lazy var championshipLabel: UILabel = {
        UILabel()
            .text(viewModel.entity.competition.name)
            .alignment(.center)
            .numberOfLines(0)
            .enableAutoLayout()
    }()
}

extension MatchDetailsViewController {
    private func setupUI() {
        //Strings with internationalization handling
        title = "details_screen_title".localized()
        view.background(color: .white)
            .addSubviews(titleLabel, dateLabel, championshipLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            championshipLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            championshipLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            championshipLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            championshipLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
