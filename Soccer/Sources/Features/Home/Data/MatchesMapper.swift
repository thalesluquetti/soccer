//
//  MatchesMapper.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

// MARK: - MatchesMapper

enum MatchesMapper {
  static func transform(_ response: APIProviderResponse) throws -> [MatchDTO] {
    guard
        let dto = try? JSONDecoder().decode([MatchDTO].self, from: response.data)
    else {
        throw MatchesError.invalidData
    }

    return dto
  }
}
