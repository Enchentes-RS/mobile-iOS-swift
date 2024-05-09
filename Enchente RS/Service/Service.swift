//
//  Service.swift
//  Enchente RS
//
//  Created by Marina De Pazzi on 07/05/24.
//

import Foundation
import Combine

protocol Service {
    associatedtype Client
    
    static var endpoint: String { get }
    var client: Client { get set }
    
    func fetchShelters() -> AnyPublisher<[Shelter], Error>
}

final class ShelterService: Service {
    typealias Client = HTTPClient
    
    static var endpoint: String = "https://api.mapasolidario.com.br/locals"
    
    var client: Client
    
    init(client: Client = URLSession.shared) {
        self.client = client
    }
    
    func fetchShelters() -> AnyPublisher<[Shelter], any Error> {
        let request = URLRequest(url: URL(string: Self.endpoint)!)
        
        return self.client.perform(for: request)
            .receive(on: DispatchQueue.main)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap({ data, response in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw NSError(domain: "Error while trying to map data", code: 99)
                }
                
                return data
            })
            .decode(type: [Shelter].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
