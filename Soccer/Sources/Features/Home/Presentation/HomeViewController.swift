//
//  HomeViewController.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 14/12/23.
//

import Combine
import UIKit

// MARK: - HomeViewController

//Interacts with the ViewModel and displays data to the user.
final class HomeViewController: UIViewController {
    // MARK: Lifecycle

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchMatches()
    }

    // MARK: Private properties

    private let viewModel: HomeViewModel
    private var cancellables: Set<AnyCancellable> = []
    private lazy var tableView: UITableView = {
        let tableView = UITableView().enableAutoLayout()
        tableView.register(cell: MatchesTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    private lazy var activityIndicator: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .large)
            .hidesWhenStopped(true)
            .color(.gray)
            .enableAutoLayout()
    }()
    private lazy var errorLabel: UILabel = {
        UILabel()
            .textColor(.red)
            .isHidden(true)
            .alignment(.center)
            .numberOfLines(0)
            .enableAutoLayout()
    }()
}

extension HomeViewController {
    private func setupUI() {
        //Strings with internationalization handling
        title = "matches_screen_title".localized()
        view.background(color: .white)
            .addSubviews(tableView, errorLabel, activityIndicator)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            errorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    private func bindViewModel() {
        viewModel.$matches
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.handleViewState(state)
            }
            .store(in: &cancellables)
    }
    
    private func handleViewState(_ state: HomeViewState) {
        state == .loading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        if case let .error(message) = state {
            errorLabel
                .text(message)
                .isHidden(false)
        }
        tableView.isHidden(state != .loaded)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: MatchesTableViewCell.self)
        let entity = viewModel.matches[indexPath.row]
        cell.configure(entity: entity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entity = viewModel.matches[indexPath.row]
        viewModel.goToNextScreen(entity: entity)
    }
}
