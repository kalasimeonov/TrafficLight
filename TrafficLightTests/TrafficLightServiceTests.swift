//
//  TrafficLightServiceTests.swift
//  TrafficLightTests
//
//  Created by Evelina Zaneva on 13.05.24.
//

import XCTest
import Combine
@testable import TrafficLight

class TrafficLightServiceTests: XCTestCase {
    
    var trafficLightService: TrafficLightService!
    
    override func setUpWithError() throws {
        trafficLightService = TrafficLightService()
    }

    override func tearDownWithError() throws {
        trafficLightService = nil
    }
    
    func testTrafficLightSequence() throws {
        let expectation = XCTestExpectation(description: "Traffic light sequence completes correctly")
        var trafficLightSequence: [TrafficLight] = []
        var cancellables: Set<AnyCancellable> = []
        
        trafficLightService.startTrafficLight()
        
        trafficLightService.$trafficLight
            .sink { trafficLight in
                trafficLightSequence.append(trafficLight)
                
                if trafficLightSequence.count == 4 {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 12)
        XCTAssertEqual(trafficLightSequence, [.red, .green, .yellow, .red])
    }
}
