//
//  String+Extensions.swift
//  TrafficLight
//
//  Created by Evelina Zaneva on 12.05.24.
//

extension String {
    func isAlphanumeric() -> Bool {
        return !self.isEmpty && self.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}
