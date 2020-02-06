//
//  RootView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/3/20.
// ✌️
//

import SwiftUI


struct RootView {

}


// MARK: - View
extension RootView: View {

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Getting Started")) {
                    NavigationLink(destination: GettingStarted_NoAnimationExample()) {
                        Text("Changing Properties Without Animation")
                    }
                    NavigationLink(destination: GettingStarted_WithAnimationExample()) {
                        Text("Changing Properties With Animation")
                    }
                    NavigationLink(destination: GettingStarted_CurvesExample()) {
                        Text("Animation Curves")
                    }
                    NavigationLink(destination: GettingStarted_Challenge1()) {
                        Text("Challenge 1: Move the Circle")
                    }
                }
            }
            .navigationBarTitle("SwiftUI Animations Mastery")
        }
    }
}


// MARK: - Computeds
extension RootView {
}


// MARK: - View Variables
extension RootView {
}


// MARK: - Private Helpers
private extension RootView {
}



// MARK: - Preview
struct RootView_Previews: PreviewProvider {

    static var previews: some View {
        RootView()
    }
}
