//
// GamepadButton.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/7/21.
// ✌️
//

import SwiftUI


enum GamepadButton {
    case circle
    case square
    case triangle
    case x
}

extension GamepadButton: CaseIterable {}

extension GamepadButton: Identifiable {
    var id: String { symbolName }
}


// MARK: - Computeds
extension GamepadButton {
    
    var symbolName: String {
        switch self {
        case .circle:
            return "circle.circle.fill"
        case .square:
            return "square.circle.fill"
        case .triangle:
            return "triangle.circle.fill"
        case .x:
            return "x.circle.fill"
        }
    }
    
    
    var symbolColor: Color {
        switch self {
        case .circle:
            return Color("GamepadCircle")
        case .square:
            return Color("GamepadSquare")
        case .triangle:
            return Color("GamepadTriangle")
        case .x:
            return Color("GamepadX")
        }
    }
    
    var description: String {
        switch self {
        case .circle:
            return "Circle Button"
        case .square:
            return "Square Button"
        case .triangle:
            return "Triangle Button"
        case .x:
            return "X Button"
        }
    }
}

