//
//  TrafficLightScreen.swift
//  TrafficLight
//
//  Created by Evelina Zaneva on 13.05.24.
//

import SwiftUI

struct TrafficLightScreen: View {
    
    enum Constants {
        static let titleFontSize = 35.0
        static let backgroundColor = Color.indigo
    }
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: Constants.titleFontSize, weight: .bold))
                .padding(.top)
            Spacer()
            TrafficLightView()
            Spacer()
        }.background(Constants.backgroundColor)
    }
}

#Preview {
    TrafficLightScreen(title: "Panamera")
}
