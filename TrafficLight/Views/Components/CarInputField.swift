//
//  CarInputField.swift
//  TrafficLight
//
//  Created by Evelina Zaneva on 12.05.24.
//

import SwiftUI

struct CarInputField: View {
    
    enum Constants {
        static let enterYourCarModel = "Enter your car model"
        static let exampleInput = "Example: CLS63"
        static let inputRequirements = "Car model must be at least 3 characters long and no special characters are allowed!"
        static let fontSize = 18.0
        static let textFieldOpacity = 0.7
        static let warningIconWidth = 25.0
        static let warningIconHeight = 25.0
        static let warningIconName = "exclamationmark.triangle.fill"
        static let warningViewCornerRadius = 8.0
        static let spacing = 0.0
        static let warningViewBackgroundColor = Color.gray.opacity(0.5)
    }
    
    @Binding var textInput: String
    @Binding var isInputValid: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.enterYourCarModel)
                .font(.system(size: Constants.fontSize, weight: .regular))
            TextField(Constants.exampleInput, text: $textInput)
                .textFieldStyle(.roundedBorder)
                .opacity(Constants.textFieldOpacity)
            if !isInputValid && !textInput.isEmpty {
                HStack(spacing: Constants.spacing) {
                    Image(systemName: Constants.warningIconName)
                        .resizable()
                        .frame(width: Constants.warningIconWidth, height: Constants.warningIconWidth)
                    Text(Constants.inputRequirements)
                        .font(.system(size: Constants.fontSize))
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .padding()
                .background(Constants.warningViewBackgroundColor)
                .cornerRadius(Constants.warningViewCornerRadius)
                .padding(.vertical)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CarInputField(textInput: .constant("CLS350"), isInputValid: .constant(false))
}
