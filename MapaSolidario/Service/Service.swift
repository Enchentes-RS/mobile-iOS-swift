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
    func createShelters(request: SignupModel) -> AnyPublisher<Bool, Error>
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

    func createShelters(request: SignupModel) -> AnyPublisher<Bool, Error> {
        let data: Data = {
            let json: [String:Any] = [
                "personalizations":[["to": [["email":"engrodrigotorres@gmail.com"], ["email":"contato@mapasolidario.com.br"]]]],
                  "from": ["email":"engrodrigotorres@gmail.com"],
                  "subject": "Cadastro de lugar",
                "content":[["type":"text/plain", "value":"Nome do lugar: \(request.placeName), Telefone: \(request.phoneNumber), cep: \(request.cep), cpf: \(request.cpf), Tipo: \(request.type.rawValue), Tipo: \(request.observations)"]
                            ]
              ]
            return try! JSONSerialization.data(withJSONObject: json, options: [])
        }()

        let request = {
            let apikey = ""
            let url = URL(string: "https://api.sendgrid.com/v3/mail/send")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            return request
        }()

        return URLSession.shared.dataTaskPublisher(for: request)
            .catch {error in
                return Fail(error: error).eraseToAnyPublisher()
            }
            .tryMap{ output in
                print("Output", output)
                let statusCode = (output.response as? HTTPURLResponse)?.statusCode ?? 0
                return (200...299).contains(statusCode)
            }
            .eraseToAnyPublisher()
    }
}
