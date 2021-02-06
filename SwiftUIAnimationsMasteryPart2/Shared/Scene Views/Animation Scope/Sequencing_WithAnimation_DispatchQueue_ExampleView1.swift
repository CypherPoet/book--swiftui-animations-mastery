//
// Sequencing_WithAnimation_DispatchQueue_ExampleView1.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/28/20.
// ✌️
//

import SwiftUI


fileprivate typealias ExampleView = AnimationScopeViewer.Sequencing_WithAnimation_DispatchQueue_ExampleView1


extension AnimationScopeViewer {
    struct Sequencing_WithAnimation_DispatchQueue_ExampleView1 {
        @State private var redLightState: LightState = .off
        @State private var yellowLightState: LightState = .off
        @State private var greenLightState: LightState = .off
        
        @State private var isAnimating = false
    }
}


// MARK: - Static Properties
extension ExampleView {
    static let lightSwitchDuration: TimeInterval = 0.3
    
    static let lightSwitchAnimation = Animation
        .easeInOut(duration: lightSwitchDuration)
}


// MARK: - `View` Body
extension ExampleView: View {
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Spacer()
            
            LightView(color: .red, isOn: redLightState == .on)
            LightView(color: .yellow, isOn: yellowLightState == .on)
            LightView(color: .green, isOn: greenLightState == .on)
            
            Spacer()
            Spacer()
            
            Button(
                action: performAnimation,
                label: {
                    Label(
                        title: { Text("Animate") },
                        icon: { Text("🎬") }
                    )
                }
            )
            .disabled(isAnimating)
        }
        .padding()
        .padding(.vertical)
        .navigationTitle("withAnimation via Dispatch")
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - Computeds
extension ExampleView {
}


// MARK: - View Variables
private extension ExampleView {
    
    struct LightView: View {
        var color: Color
        var isOn: Bool
        
        var currentColor: Color { isOn ? color : Color.gray }
        
        var body: some View {
            if isOn {
                Circle()
                    .fill(color)
                    .shadow(color: color, radius: 20, x: 0.0, y: 0.0)
                
            } else {
                Circle()
                    .fill(Color.gray)
                    .shadow(color: .gray, radius: 18, x: 0.0, y: 0.0)
                    .opacity(0.4)
            }
        }
    }
}


// MARK: - Private Helpers
private extension ExampleView {
    
    func activateRed() {
        self.redLightState = .on
        self.yellowLightState = .off
        self.greenLightState = .off
    }
    
    func activateYellow() {
        self.redLightState = .off
        self.yellowLightState = .on
        self.greenLightState = .off
    }
    
    func activateGreen() {
        self.redLightState = .off
        self.yellowLightState = .off
        self.greenLightState = .on
    }
    
    
    func performAnimation() {
        //        withAnimation(Self.lightSwitchAnimation) {
        //            isAnimating = true
        //            activateRed()
        //        }
        //
        //        withAnimation(Self.lightSwitchAnimation.delay(1.0)) {
        //            activateYellow()
        //        }
        //
        //        withAnimation(Self.lightSwitchAnimation.delay(2.0)) {
        //            activateGreen()
        //            isAnimating = false
        //        }
        
        
        DispatchQueue.main.asyncAfter(
            deadline: .now()
        ) {
            withAnimation(Self.lightSwitchAnimation) {
                isAnimating = true
                activateRed()
            }
        }
        
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 1.0
        ) {
            withAnimation(Self.lightSwitchAnimation) {
                activateYellow()
            }
        }
        
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 2.0
        ) {
            withAnimation(Self.lightSwitchAnimation) {
                activateGreen()
                isAnimating = false
            }
        }
    }
}


// MARK: - LightState
extension ExampleView {
    
    enum LightState {
        case off
        case on
    }
}


#if DEBUG
// MARK: - Preview
struct Sequencing_WithAnimation_ExampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ExampleView()
        }
    }
}
#endif
