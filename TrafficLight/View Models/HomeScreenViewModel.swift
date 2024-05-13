//
//  HomeScreenViewModel.swift
//  TrafficLight
//
//  Created by Evelina Zaneva on 12.05.24.
//

import Foundation
import Combine

final class HomeScreenViewModel: ObservableObject {
    @Published var carModelInput: String = ""
    @Published var isInputValid: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        subscribe()
    }
    
    private func subscribe() {
        $carModelInput
            .sink { [weak self] input in
                guard input.isAlphanumeric() &&
                   input.count > 2 else {
                    self?.isInputValid = false
                    return
                }
                
                self?.isInputValid = true
            }
            .store(in: &cancellables)
    }
    
}
