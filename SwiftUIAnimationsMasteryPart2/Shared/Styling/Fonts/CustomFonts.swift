//
// CustomFonts.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/9/21.
// ✌️
//


import SwiftUI


enum CustomFont {
    
    case phosphateSolid
    case phosphateInline
    
    
    var name: String {
        switch self {
        case .phosphateSolid:
            return "Phosphate Solid"
        case .phosphateInline:
            return "Phosphate Inline"
        }
    }

    
//    static func abolition(size: CGFloat) -> Font {
//        return Font.custom("Abolition", size: size)
//    }
//
//    static let screenHeadline = abolition(size: 48).weight(.semibold)
//    static let sectionLargeTitle = abolition(size: 34).weight(.semibold)
//    static let sectionHeadline = abolition(size: 28).weight(.semibold)
}


extension View {
    
    func customFont(_ font: CustomFont, size: CGFloat) -> some View {
        self
            .font(.custom(font.name, size: size))
    }
}
