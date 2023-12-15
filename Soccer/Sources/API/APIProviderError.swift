//
//  APIProviderError.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

enum APIProviderError: Error {
    /// Não foi encontrado o endpoint solicitado
    case notFound

    /// Ocorreu algum erro no server
    case remoteServer

    /// O server expirou a sessão informada
    case accessDenied

    /// O cliente tentou acessar um endpoint sem informar a API-Key
    case missingApiKey

    /// Ocorreu erro ao executar o `APIRequestBuilder.buildRequest`
    case urlBuilderError
}
