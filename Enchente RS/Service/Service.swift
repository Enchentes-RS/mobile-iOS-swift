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
    
    var client: Client { get set }
    
    func fetchShelters() -> AnyPublisher<[Shelter], Error>
}

class ShelterService: Service {
    typealias Client = HTTPClient
    
    var client: Client
    var subscriptions = Set<AnyCancellable>()
    
    init(client: Client = URLSession.shared) {
        self.client = client
    }
    
    func fetchShelters() -> AnyPublisher<[Shelter], any Error> {
        let request = URLRequest(url: URL(string: "http://185.139.1.231:3000/locals")!)
        
        return self.client.perform(for: request)
            .print()
            .receive(on: DispatchQueue.main)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .map(\.data)
            .decode(type: [Shelter].self, decoder: JSONDecoder())
            .print()
            .eraseToAnyPublisher()
    }
    
    
}
