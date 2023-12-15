//
//  APIClient.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import Combine
import Foundation

// MARK: - APIClient

final class APIClient: APIProvider {
    // MARK: Lifecycle

    init(
        session: URLSession,
        configuration: APIConfigurable)
    {
        self.session = session
        self.configuration = configuration
    }

    // MARK: Internal

    func request(for request: APIRequestBuilder) -> AnyPublisher<APIProviderResponse, Error> {
        return Future<APIProviderResponse, Error> { [weak self] promise in
            guard let self = self else {
                promise(.failure(APIProviderError.notFound))
                return
            }
            guard let urlRequest = try? request.buildRequest(baseURL: self.configuration.baseURL) else {
                promise(.failure(APIProviderError.urlBuilderError))
                return
            }

            let task = self.session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }

                guard let data = data, let response = response as? HTTPURLResponse else {
                    promise(.failure(APIProviderError.remoteServer))
                    return
                }

                let providerResponse = APIProviderResponse(
                    statusCode: response.statusCode,
                    data: data,
                    request: urlRequest,
                    response: response)

                promise(.success(providerResponse))
            }

            task.resume()
        }
        .eraseToAnyPublisher()
    }


  // MARK: Private properties

  private let session: URLSession
  private let configuration: APIConfigurable
}
