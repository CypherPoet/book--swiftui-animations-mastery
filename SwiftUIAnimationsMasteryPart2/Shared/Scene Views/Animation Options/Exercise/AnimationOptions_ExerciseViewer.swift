//
// AnimationOptions_ExerciseViewer.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/9/21.
// ✌️
//

import SwiftUI


struct AnimationOptions_ExerciseViewer {
    @ScaledMetric private var bodyFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
    
    @State private var isShowingLoginForm = false
    
    
    enum Durations {
        static let shieldScale: TimeInterval = 0.30
    }
    
    enum Animations {
        static let shieldScale = Animation.spring()
    }
}


// MARK: - `View` Body
extension AnimationOptions_ExerciseViewer: View {
    
    var body: some View {
        ZStack {
            backgroundGradient.edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 12.0) {
                    Text("Exercise")
                        .customFont(.phosphateSolid, size: headlineFontSize)
                        .foregroundColor(Color("Primary"))
                    
                    Text("Show Login")
                        .customFont(.phosphateSolid, size: headlineFontSize / 2.5)
                        .foregroundColor(.accentColor)
                }
                
                Spacer()
                
                shieldButton
                    .scaleEffect(shieldButtonScale, anchor: .center)
                
                if isShowingLoginForm {
                    LoginFormView(initialDelay: Durations.shieldScale * 1.25)
                        .padding(.horizontal)
                        .padding(.top, bodyFontSize * 2)
                }
                
                Spacer()
                Spacer()
            }
            .padding(.top, headlineFontSize)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
        }
    }
}


// MARK: - Computeds
extension AnimationOptions_ExerciseViewer {
    
    var shieldButtonScale: CGFloat {
        isShowingLoginForm ? 1.0 : 4.0
    }
    
    var headlineFontSize: CGFloat { bodyFontSize * 5 }
}


// MARK: - View Content Builders
private extension AnimationOptions_ExerciseViewer {
    
    var backgroundGradient: some View {
        RadialGradient(
            gradient: CustomGradients.screenBackground1,
            center: .center,
            startRadius: 0,
            endRadius: UIScreen.main.bounds.height * 2
        )
        .scaleEffect(x: 1.0, y: 2, anchor: .center)
    }
    
    
    var shieldButton: some View {
        Button(
            action: {
                withAnimation(Self.Animations.shieldScale) {
                    isShowingLoginForm.toggle()
                }
            },
            label: {
                Label(
                    title: { Text("Show Login Form") },
                    icon: {
                        Image(systemName: "lock.shield")
                            .font(.system(size: bodyFontSize * 3))
                            .foregroundColor(Color("Primary"))
                    }
                )
                .labelStyle(IconOnlyLabelStyle())
            }
        )
    }
}


// MARK: - Private Helpers
private extension AnimationOptions_ExerciseViewer {
}


#if DEBUG
// MARK: - Preview
struct AnimationOptions_ExerciseViewer_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            AnimationOptions_ExerciseViewer()
                .accentColor(Color("PrimaryAccent"))
                .preferredColorScheme(.dark)
        }
    }
}

#endif
