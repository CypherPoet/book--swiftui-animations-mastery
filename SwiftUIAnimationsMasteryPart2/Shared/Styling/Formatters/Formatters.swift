//
// Formatters.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/7/21.
// ✌️
//

import Foundation

enum Formatters {
    
    static let largeTemperatureDisplay: MeasurementFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        
        let formatter = MeasurementFormatter()
        
        formatter.unitStyle = .short
        formatter.unitOptions = .providedUnit
        formatter.numberFormatter = numberFormatter
        
        return formatter
    }()
}
