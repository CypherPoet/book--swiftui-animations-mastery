//
// AnimationScopeViewer.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/27/20.
// ✌️
//

import SwiftUI


struct AnimationScopeViewer {
}


// MARK: - `View` Body
extension AnimationScopeViewer: View {
    
    var body: some View {
        List {
            Section(header: Text("Animation Sequencing")) {
                Group {
                    NavigationLink(
                        destination: Sequencing_WithAnimation_Delay_ExampleView()
                    ) {
                        Text("withAnimation via delay")
                    }
                    
                    NavigationLink(
                        destination: Sequencing_WithAnimation_DispatchQueue_ExampleView1()
                    ) {
                        Text("withAnimation via DispatchQueue 1")
                    }
                    
                    NavigationLink(
                        destination: Sequencing_WithAnimation_DispatchQueue_ExampleView2()
                    ) {
                        Text("withAnimation via DispatchQueue 2")
                    }
                }
                
                Section(header: Text("Parent/Child Animation Sequencing")) {
                    Group {
                        NavigationLink(
                            destination: ParentChild_Animation_Sequencing_ProblemExampleView()
                        ) {
                            Text("Broken Animation Sequencing")
                        }
                    }
                }
            }
        }
        .navigationTitle("Animation Scope")
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - Computeds
extension AnimationScopeViewer {
}


// MARK: - View Variables
private extension AnimationScopeViewer {
}


// MARK: - Private Helpers
private extension AnimationScopeViewer {
}


#if DEBUG
// MARK: - Preview
struct AnimationScopeViewer_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            AnimationScopeViewer()
        }
    }
}
#endif
