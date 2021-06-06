//
// TableOfContentsView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/25/20.
// ✌️
//

import SwiftUI


struct TableOfContentsView {
}


// MARK: - `View` Body
extension TableOfContentsView: View {
    
    var body: some View {
        NavigationView {
            List {
                animationOptionsSection
                    .themeColors(ThemeColorGroups.theme1)
                    .themeGradients(ThemeGradientGroups.theme1)
            }
            .navigationTitle("Table of Contents")
        }
    }
}


// MARK: - Computeds
extension TableOfContentsView {
}


// MARK: - View Variables
private extension TableOfContentsView {
    
    var animationOptionsSection: some View {
        Section(header: Text("Animation Options")) {
            NavigationLink(
                destination: AnimationScopeViewer(),
                label: {
                    Text("Animation Scope")
                }
            )
            
            NavigationLink(
                destination: AnimationEnablingViewer(),
                label: {
                    Text("Enabling and Disabling Animations")
                }
            )
            
            NavigationLink(
                destination: AnimationOptions_ExerciseViewer(),
                label: {
                    Text("Exercise")
                }
            )
            
            NavigationLink(
                destination: AnimationOptions_CheckYourUnderstandingViewer(),
                label: {
                    Text("Check Your Understanding")
                }
            )
            
            NavigationLink(
                destination: AnimationOptions_Challenge1Viewer(),
                label: {
                    Text("Challenge 1")
                }
            )
            
            NavigationLink(
                destination: AnimationOptions_Challenge2Viewer(),
                label: {
                    Text("Challenge 2")
                }
            )
        }
    }
}


// MARK: - Private Helpers
private extension TableOfContentsView {
}


#if DEBUG
// MARK: - Preview
struct TableOfContentsView_Previews: PreviewProvider {
    
    static var previews: some View {
        TableOfContentsView()
    }
}
#endif
