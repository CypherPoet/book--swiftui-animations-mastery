//
//  AnimationTriggersContainerView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/12/20.
// ✌️
//

import SwiftUI


struct AnimationTriggersContainerView {
}


// MARK: - View
extension AnimationTriggersContainerView: View {

    var body: some View {
        List {
            Section {
                NavigationLink(destination: AnimationTriggers_Buttons()) {
                    Text("AnimationTriggers: Buttons")
                }
                
                NavigationLink(destination: AnimationTriggers_SegmentedControls()) {
                    Text("AnimationTriggers: Segmented Controls")
                }
                
                NavigationLink(destination: AnimationTriggers_Sliders()) {
                    Text("AnimationTriggers: Sliders")
                }
                
                NavigationLink(destination: AnimationTriggers_Steppers()) {
                    Text("AnimationTriggers: Steppers")
                }
                
                NavigationLink(destination: AnimationTriggers_Toggles()) {
                    Text("AnimationTriggers: Toggles")
                }
                
                NavigationLink(destination: AnimationTriggers_DragGestures()) {
                    Text("AnimationTriggers: Drag Gestures")
                }
                
                NavigationLink(destination: AnimationTriggers_LongPressGestures()) {
                    Text("AnimationTriggers: Long-Press Gestures")
                }
                
                NavigationLink(destination: AnimationTriggers_TapGestures()) {
                    Text("AnimationTriggers: Tap Gestures")
                }
            }
        }
        .navigationBarTitle(Text("Animation Triggers"), displayMode: .large)
    }
}


// MARK: - Computeds
extension AnimationTriggersContainerView {
}


// MARK: - View Variables
extension AnimationTriggersContainerView {
}


// MARK: - Private Helpers
private extension AnimationTriggersContainerView {
}



// MARK: - Preview
struct AnimationTriggersContainerView_Previews: PreviewProvider {

    static var previews: some View {
        AnimationTriggersContainerView()
    }
}
