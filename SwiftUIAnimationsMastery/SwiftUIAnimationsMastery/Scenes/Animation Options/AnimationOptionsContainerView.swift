//
//  AnimationOptionsContainerView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/2/20.
// ✌️
//

import SwiftUI


struct AnimationOptionsContainerView {
}


// MARK: - View
extension AnimationOptionsContainerView: View {

    var body: some View {
        List {
            Section(header: Text("Examples")) {
                Group {
                    NavigationLink(destination: AnimationOptions_DurationParameter()) {
                        Text("Animation Options: Duration Parameter")
                    }
                    
                    NavigationLink(destination: AnimationOptions_LongDurationParameter()) {
                        Text("Animation Options: (Long) Duration")
                    }
                    
                    NavigationLink(destination: AnimationOptions_Delays()) {
                        Text("Animation Options: Delays")
                    }
                    
                    NavigationLink(destination: AnimationOptions_SequencingWithDelays()) {
                         Text("Animation Options: Sequencing via Delay")
                    }
                    
                    NavigationLink(destination: AnimationOptions_RepeatingWithCount()) {
                         Text("Animation Options: Repeating + Count")
                    }
                    
                    NavigationLink(destination: AnimationOptions_RepeatingWithCountAndAutoReverse()) {
                         Text("Animation Options: Repeating + Count + Auto-Reverse")
                    }
                    
                    NavigationLink(destination: AnimationOptions_RepeatingForever()) {
                         Text("Animation Options: Repeating Forever")
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
        .navigationBarTitle(Text("Animation Triggers"), displayMode: .large)
    }
}


// MARK: - Computeds
extension AnimationOptionsContainerView {
}


// MARK: - View Variables
extension AnimationOptionsContainerView {
}


// MARK: - Private Helpers
private extension AnimationOptionsContainerView {
}



// MARK: - Preview
struct AnimationOptionsContainerView_Previews: PreviewProvider {

    static var previews: some View {
        AnimationOptionsContainerView()
    }
}
