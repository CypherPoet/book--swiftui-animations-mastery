//
// ThemeColorGroups.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/31/21.
// ✌️
//

import SwiftUI


protocol ThemeColorGrouping {
    var primaryAccent: Color { get }
    var secondaryAccent1: Color { get }
    var secondaryAccent2: Color { get }
    var secondaryAccent3: Color { get }
    
    var backgroundGradient1_1: Color { get }
    var backgroundGradient1_2: Color { get }
}



struct Theme1ColorGroup: ThemeColorGrouping {
    let primaryAccent = Color("Theme1-PrimaryAccent", bundle: .main)
    let secondaryAccent1 = Color("Theme1-SecondaryAccent1", bundle: .main)
    let secondaryAccent2 = Color("Theme1-SecondaryAccent2", bundle: .main)
    let secondaryAccent3 = Color("Theme1-SecondaryAccent3", bundle: .main)
    
    
    let backgroundGradient1_1 = Color("Theme1-BackgroundGradient1--1", bundle: .main)
    let backgroundGradient1_2 = Color("Theme1-BackgroundGradient1--2", bundle: .main)
}


enum ThemeColorGroups {
    static let theme1 = Theme1ColorGroup()
}


private struct ThemeColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorGrouping = ThemeColorGroups.theme1
}


extension EnvironmentValues {
    
    var themeColors: ThemeColorGrouping {
        get { self[ThemeColorKey.self] }
        set { self[ThemeColorKey.self] = newValue }
    }
}


extension View {
    
    func themeColors(_ themeColorGroup: ThemeColorGrouping) -> some View {
        environment(\.themeColors, themeColorGroup)
    }
}
