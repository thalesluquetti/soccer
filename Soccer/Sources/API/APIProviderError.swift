//
//  APIProviderError.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Foundation

enum APIProviderError: Error {
    /// The requested endpoint was not found
    case notFound

    /// An error occurred on the server
    case remoteServer

    /// The server has expired the provided session
    case accessDenied

    /// The client attempted to access an endpoint without providing the API key
    case missingApiKey

    /// An error occurred while executing the 'APIRequestBuilder.buildRequest'
    case urlBuilderError
}
