//
//  HTTPClient.swift
//  Enchente RS
//
//  Created by Marina De Pazzi on 07/05/24.
//

import Foundation
import Combine

protocol HTTPClient {
    func perform(for request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), Error>
}

extension URLSession: HTTPClient {
    func perform(for request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), Error> {
        return dataTaskPublisher(for: request)
            .mapError({ $0 as Error })
            .eraseToAnyPublisher()
    }
}
