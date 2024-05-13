//
//  TrafficLightView.swift
//  TrafficLight
//
//  Created by Evelina Zaneva on 12.05.24.
//

import SwiftUI

struct TrafficLightView: View {
    
    enum Constants {
        static let spacing = 0.0
        static let poleWidth = 10.0
        static let poleHeight = 30.0
        static let trafficLightWidth = 100.0
        static let trafficLightHeight = 200.0
        static let trafficLightColorOpacity = 0.8
        static let lightOnShadowRadius = 10.0
        static let lightOffShadowRadius = 0.0
    }
    
    @State private var redLightShadow = 0.0
    @State private var yellowLightShadow = 0.0
    @State private var greenLightShadow = 0.0
    
    private let trafficLightService: TrafficLightService = .init()

    var body: some View {
        VStack(spacing: Constants.spacing) {
            Rectangle()
                .frame(height: Constants.poleWidth)
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.leading)
                    .foregroundStyle(Color.gray)
            Rectangle()
                .frame(width: Constants.poleWidth, height: Constants.poleHeight)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.leading)
                .foregroundStyle(Color.gray)
            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: Constants.trafficLightWidth, height: Constants.trafficLightHeight)
                    .foregroundStyle(Color.black.opacity(Constants.trafficLightColorOpacity))
                VStack {
                    Circle()
                        .foregroundStyle(.red)
                        .shadow(color: Color.red, radius: redLightShadow)
                    Circle()
                        .foregroundStyle(.yellow)
                        .shadow(color: Color.yellow, radius: yellowLightShadow)
                    Circle()
                        .foregroundStyle(.green)
                        .shadow(color: Color.green, radius: greenLightShadow)
                }.padding()
            }
            .frame(width: Constants.trafficLightWidth, height: Constants.trafficLightHeight)
        }
        .onAppear {
            trafficLightService.startTrafficLight()
        }
        .onReceive(trafficLightService.$trafficLight, perform: { light in
            changeLight(to: light)
        })
    }
    
    func changeLight(to trafficLight: TrafficLight) {
        switch trafficLight {
        case .red:
            yellowLightShadow = Constants.lightOffShadowRadius
            redLightShadow = Constants.lightOnShadowRadius
        case .yellow:
            greenLightShadow = Constants.lightOffShadowRadius
            yellowLightShadow = Constants.lightOnShadowRadius
        case .green:
            redLightShadow = Constants.lightOffShadowRadius
            greenLightShadow = Constants.lightOnShadowRadius
        }
    }
}

#Preview {
    TrafficLightView()
}
