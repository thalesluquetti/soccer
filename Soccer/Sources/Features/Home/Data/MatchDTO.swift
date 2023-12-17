//
//  MatchDTO.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

// MARK: - MatchesDTO

struct MatchDTO: Codable, Equatable {
    let title: String
    let thumbnail: String
    let date: String
    let competition: CompetitionDTO

    func toEntity() -> MatchEntity {
        MatchEntity(title: title, thumbnail: thumbnail, date: date.formatDateString(), competition: competition.toEntity())
    }
}

struct CompetitionDTO: Codable, Equatable {
    let name: String

    func toEntity() -> CompetitionEntity {
        CompetitionEntity(name: name)
    }
}
