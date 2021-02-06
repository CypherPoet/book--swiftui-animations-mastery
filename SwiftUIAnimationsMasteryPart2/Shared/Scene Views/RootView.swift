//
// RootView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/23/20.
// ✌️
//

import SwiftUI


struct RootView {
    
    @AppStorage("hasShownWelcomeScreen")
    private var hasShownWelcomeScreen: Bool = false
}


// MARK: - `View` Body
extension RootView: View {
    
    var body: some View {
        if hasShownWelcomeScreen {
            TableOfContentsView()
        } else {
            WelcomeView()
        }
    }
}


// MARK: - Computeds
extension RootView {
}


// MARK: - View Variables
private extension RootView {
}


// MARK: - Private Helpers
private extension RootView {
}


#if DEBUG
// MARK: - Preview
struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView()
    }
}
#endif
