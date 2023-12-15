//
//  MatchEntity.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

// MARK: - MatchEntity

struct MatchEntity: Equatable {
    let title: String
    let thumbnail: String
    let date: String
    let competition: CompetitionEntity
}

struct CompetitionEntity: Equatable {
    let name: String
}
