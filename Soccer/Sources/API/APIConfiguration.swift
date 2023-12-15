//
//  APIConfiguration.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

struct APIConfiguration: APIConfigurable {
    //URL base, poderia pegar da variaveis de ambiente do plist de acordo com o target selecionado
    var baseURL: URL {
        guard
            let baseUrl = URL(string: "https://free-football-soccer-videos.p.rapidapi.com/")
        else {
            fatalError("Error on unwrap base url")
        }
        return baseUrl
    }
}
