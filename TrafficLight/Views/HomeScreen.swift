//
//  HomeScreen.swift
//  TrafficLight
//
//  Created by Evelina Zaneva on 12.05.24.
//

import SwiftUI

struct HomeScreen: View {
    
    enum Constants {
        static let title = "Traffic lights"
        static let titleFontSize = 24.0
        static let buttonTitle = "Start Driving"
        static let buttonHeight = 50.0
        static let buttonBackgroundColor = Color.white.opacity(0.7)
        static let buttonCornerRadius = 8.0
        static let textColor = Color.black
        static let stackSpacing = 0.0
        static let backgroundColor = Color.indigo
    }
    
    @StateObject private var viewModel: HomeScreenViewModel = .init()
    
    private var titleView: some View {
        Text(Constants.title)
            .font(.system(size: Constants.titleFontSize, weight: .heavy))
            .padding()
    }
    
    private var startDrivingButton: some View {
        NavigationLink {
            TrafficLightScreen(title: viewModel.carModelInput)
        } label: {
            Text(Constants.buttonTitle)
                .frame(height: Constants.buttonHeight)
                .frame(maxWidth: .infinity)
                .background(Constants.buttonBackgroundColor)
                .cornerRadius(Constants.buttonCornerRadius)
                .foregroundStyle(Constants.textColor)
        }
        .padding()
        .disabled(!viewModel.isInputValid)
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                Constants.backgroundColor
                    .edgesIgnoringSafeArea(.vertical)
                VStack(spacing: Constants.stackSpacing) {
                    titleView
                    Spacer()
                    CarInputField(textInput: $viewModel.carModelInput, isInputValid: $viewModel.isInputValid)
                    Spacer()
                    startDrivingButton
                }
            }
            .onAppear {
                viewModel.carModelInput = ""
            }
        }.tint(Constants.textColor)
    }
}

#Preview {
    HomeScreen()
}
