//
//  MatchDetailsViewModel.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

final class MatchDetailsViewModel: MatchDetailsViewModelProtocol {
    // MARK: Lifecycle

    init(entity: MatchEntity) {
        self.entity = entity
    }
    
    // MARK: Internal properties
    
    let entity: MatchEntity
}
