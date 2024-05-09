//
//  SignupViewModel.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 09/05/24.
//

import Foundation
import Combine

class SignupViewModel: ObservableObject {

    @Published var signupModel = SignupModel()
    @Published var status = false

    private let service: ShelterService
    private var cancellations = [AnyCancellable]()

    init(service: ShelterService) {
        self.service = service
    }

    func sendEmail() {
        service.createShelters(request: signupModel)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                if case .failure(let error) = response {
                    print(error.localizedDescription)
                }
            } receiveValue: { response in
                self.status = response
            }
            .store(in: &cancellations)
    }

    func anyValueIsEmpty() -> Bool {
        return signupModel.placeName.isEmpty
        || signupModel.cep.isEmpty
        || signupModel.cpf.isEmpty
        || signupModel.phoneNumber.isEmpty
        || signupModel.observations.isEmpty
    }

}

