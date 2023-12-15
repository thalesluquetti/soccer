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
        let label = UILabel()
        label.textAlignment = .center
        label.text = viewModel.entity.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = viewModel.entity.date
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var championshipLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = viewModel.entity.competition.name
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension MatchDetailsViewController {
    private func setupUI() {
        title = "Detalhes"
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(dateLabel)
        view.addSubview(championshipLabel)
        
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
