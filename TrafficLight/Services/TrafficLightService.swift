//
//  TrafficLightService.swift
//  TrafficLight
//
//  Created by Evelina Zaneva on 12.05.24.
//

import Foundation

enum TrafficLight {
    case red, yellow, green
}

final class TrafficLightService: ObservableObject {
    
    enum Constants {
        static let redAndGreenTimeInterval = 4.0
        static let yellowTimeInterval = 1.0
    }
    
    @Published private(set) var trafficLight: TrafficLight = .red
    
    private var lightInterval: Double = 4.0
    private var timer: Timer?
    
    func startTrafficLight() {
        timer = Timer.scheduledTimer(withTimeInterval: lightInterval, repeats: true) { _ in
            self.changeTrafficLight()
        }
    }
    
    private func stopTrafficLight() {
        timer?.invalidate()
        timer = nil
    }
    
    private func changeTrafficLight() {
        switch trafficLight {
        case .red:
            trafficLight = .green
            updateTimerInterval(Constants.redAndGreenTimeInterval)
        case .yellow:
            trafficLight = .red
            updateTimerInterval(Constants.redAndGreenTimeInterval)
        case .green:
            trafficLight = .yellow
            updateTimerInterval(Constants.yellowTimeInterval)
        }
    }
    
    private func updateTimerInterval(_ interval: TimeInterval) {
        lightInterval = interval
        stopTrafficLight()
        startTrafficLight()
    }
}
