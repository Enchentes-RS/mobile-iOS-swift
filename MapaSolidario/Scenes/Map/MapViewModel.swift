//
//  MapViewModel.swift
//  Mapa Solidário
//
//  Created by Brenno de Moura on 08/05/24.
//

import Combine

public class MapViewModel: ObservableObject {

    // MARK: - Input
    public let loadItemsSubject = PassthroughSubject<Void, Never>()

    // MARK: - Output
    @Published var isItemsLoading = false
    @Published var items = [MapItem]()
    @Published var error: Error?

    // MARK: - Services
    private let service: ShelterService
    private var cancellations = [AnyCancellable]()

    init(service: ShelterService) {
        self.service = service

        loadItemsSubject
            .flatMap { [weak self] in
                guard self != nil else {
                    return Empty(
                        outputType: [Shelter].self,
                        failureType: Error.self
                    ).eraseToAnyPublisher()
                }
                self?.isItemsLoading = true
                return service.fetchShelters().eraseToAnyPublisher()
            }
            .sink(
                receiveCompletion: { [weak self] in
                    self?.isItemsLoading = false
                    if case .failure(let error) = $0 {
                        self?.error = error
                        self?.items = []
                    }
                },
                receiveValue: { [weak self] in
                    self?.isItemsLoading = false
                    self?.items = $0.map(MapItem.init)
                    self?.error = nil
                }
            ).store(in: &cancellations)
    }
}
