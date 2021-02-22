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
                }
                .accentColor(Color("PrimaryAccent"))
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