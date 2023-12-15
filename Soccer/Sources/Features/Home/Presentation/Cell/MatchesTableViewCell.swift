//
//  MatchesTableViewCell.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import AlamofireImage
import UIKit

// MARK: - MatchesTableViewCell

final class MatchesTableViewCell: UITableViewCell {
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Internal
    
    func configure(entity: MatchEntity) {
        imageView?.image = nil
        if let imageURL = URL(string: entity.thumbnail) {
            //Utilizado lib para cacheamento automatico de imagens, melhorando performance e economizando recursos
            imageView?.af_setImage(withURL: imageURL, completion: { [weak self] _ in
                self?.imageView?.contentMode = .scaleAspectFill
                self?.imageView?.clipsToBounds = true
                self?.layoutSubviews()
            })
        }
    }
}

extension MatchesTableViewCell {
    private func setupUI() {
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 200),
            imageView?.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ].compactMap {$0})
    }
}

// MARK: ReusableView

extension MatchesTableViewCell: ReusableView {}
