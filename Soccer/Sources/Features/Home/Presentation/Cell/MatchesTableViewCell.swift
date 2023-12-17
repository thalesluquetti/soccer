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
            //Utilized a library for automatic image caching, improving performance and saving resources
            imageView?.af_setImage(withURL: imageURL, completion: { [weak self] _ in
                self?.imageView?
                    .contentMode(.scaleAspectFill)
                    .clipToBounds(true)
                self?.layoutSubviews()
            })
        }
    }
}

extension MatchesTableViewCell {
    private func setupUI() {
        imageView?
            .enableAutoLayout()
            .parent(contentView)
            .size(height: 200)
            .fillParent()
    }
}

// MARK: ReusableView

extension MatchesTableViewCell: ReusableView {}
