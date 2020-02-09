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
                    NavigationLink(destination: GettingStarted_Challenge2()) {
                        Text("Challenge 2: Move the Circle")
                    }
                }
                
                Section(header: Text("Basic Animations")) {
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_Color()) {
                        Text("Animatable Properties: Color")
                    }
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_HueRotation()) {
                        Text("Animatable Properties: Hue Rotation")
                    }
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_Offset()) {
                        Text("Animatable Properties: Offset")
                    }
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_Alignment()) {
                        Text("Animatable Properties: Alignment")
                    }
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_GeoemetryReaderPosition()) {
                        Text("Animatable Properties: GeoemetryReader Position")
                    }
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_Opacity()) {
                        Text("Animatable Properties: Opacity")
                    }
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_RotationEffect()) {
                        Text("Animatable Properties: Rotation Effect")
                    }
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_RotationEffectAnchors()) {
                        Text("Animatable Properties: Rotation Around Anchors")
                    }
                    NavigationLink(destination: BasicAnimations_AnimatableProperties_Frame()) {
                        Text("Animatable Properties: Frame")
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
