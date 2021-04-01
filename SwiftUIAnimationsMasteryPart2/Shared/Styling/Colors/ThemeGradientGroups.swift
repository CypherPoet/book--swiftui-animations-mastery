//
// ThemeGradientGroups.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/31/21.
// ✌️
//

import SwiftUI


protocol ThemeGradientGrouping {
    var screenBackground1: Gradient { get }
}


struct Theme1GradientGroup: ThemeGradientGrouping {
    
    let screenBackground1 = Gradient(
        stops: [
            Gradient.Stop(color: ThemeColorGroups.theme1.backgroundGradient1_1, location: 0.0),
            Gradient.Stop(color: ThemeColorGroups.theme1.backgroundGradient1_2, location: 1.0),
        ]
    )
}


public enum ThemeGradientGroups {
    static let theme1 = Theme1GradientGroup()
}



private struct ThemeGradientKey: EnvironmentKey {
    static let defaultValue: ThemeGradientGrouping = ThemeGradientGroups.theme1
}


extension EnvironmentValues {
    
    var themeGradients: ThemeGradientGrouping {
        get { self[ThemeGradientKey.self] }
        set { self[ThemeGradientKey.self] = newValue }
    }
}


extension View {
    
    func themeGradients(_ themeGradientGroup: ThemeGradientGrouping) -> some View {
        environment(\.themeGradients, themeGradientGroup)
    }
}

