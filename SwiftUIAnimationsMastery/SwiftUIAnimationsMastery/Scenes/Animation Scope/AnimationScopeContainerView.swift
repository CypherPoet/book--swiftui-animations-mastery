//
//  AnimationScopeContainerView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/19/20.
// ✌️
//

import SwiftUI


struct AnimationScopeContainerView {
    
}


// MARK: - View
extension AnimationScopeContainerView: View {
    
    var body: some View {
        List {
            Section(header: Text("Examples")) {
                Group {
                    NavigationLink(destination: AnimationScope_SequenceOnSingleView()) {
                        Text("Animation Scope: Sequence on Single View")
                    }
                    
                    NavigationLink(destination: AnimationScope_ParentAndChildren()) {
                        Text("Animation Scope: Parent & Children")
                    }
                }
            }
            
            //            Section(header: Text("Exercise")) {
            //            }
            
            //            Section(header: Text("Challenge")) {
            //                NavigationLink(destination: AnimationTriggers_Challenge()) {
            //                    Text("Animation Triggers: Challenge 🏆")
            //                }
            //            }
        }
        .navigationBarTitle(Text("Animation Scope"), displayMode: .large)
    }
}


// MARK: - Computeds
extension AnimationScopeContainerView {
}


// MARK: - View Variables
extension AnimationScopeContainerView {
}


// MARK: - Private Helpers
private extension AnimationScopeContainerView {
}



// MARK: - Preview
struct AnimationScopeContainerView_Previews: PreviewProvider {
    
    static var previews: some View {
        AnimationScopeContainerView()
    }
}
