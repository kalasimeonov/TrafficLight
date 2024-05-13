//
//  HomeScreenViewModelTests.swift
//  HomeScreenViewModelTests
//
//  Created by Evelina Zaneva on 12.05.24.
//

import XCTest
import Combine
@testable import TrafficLight // Update this with your app's module name

class HomeScreenViewModelTests: XCTestCase {
    
    var viewModel: HomeScreenViewModel!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        viewModel = HomeScreenViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = []
    }
    
    func testCarModelInputValidationAlphanumeric() throws {
        let expectation = XCTestExpectation(description: "Validation passes for alphanumeric input")
        let input = "Panamera"
        
        viewModel.$isInputValid
            .dropFirst()
            .sink { isValid in
                if isValid {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.carModelInput = input
        wait(for: [expectation], timeout: 1)
    }
    
    func testCarModelInputValidationLength() throws {
        let expectation = XCTestExpectation(description: "Validation passes for input with length greater than 2")
        let input = "Te"
        
        viewModel.$isInputValid
            .dropFirst()
            .sink { isValid in
                if !isValid {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.carModelInput = input
        wait(for: [expectation], timeout: 1)
    }
    
    func testCarModelInputValidationNonAlphanumeric() throws {
        let expectation = XCTestExpectation(description: "Validation fails for non-alphanumeric input")
        let input = "Test!"
        
        viewModel.$isInputValid
            .dropFirst()
            .sink { isValid in
                if !isValid {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.carModelInput = input
        wait(for: [expectation], timeout: 1)
    }
}
