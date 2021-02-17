//
// AnimationScopeViewer.WithAnimation_Sequencing_ExampleView2.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/27/20.
// ✌️
//

import SwiftUI


fileprivate typealias ExampleView = AnimationScopeViewer.Sequencing_WithAnimation_DispatchQueue_ExampleView2
fileprivate typealias Durations = AnimationDurations


extension AnimationScopeViewer {
    
    struct Sequencing_WithAnimation_DispatchQueue_ExampleView2 {
        @Environment(\.horizontalSizeClass) private var horizontalSizeClass
        
        private let titleText = "withAnimation via Dispatch"
        private let subtitleText = "Timing & Sequencing"
        private let descriptionText1 = ""
        
        private let decisionLineWidth: CGFloat = 7.0
        private let loaderCircleLineWidth: CGFloat = 15.0
        private let yesColor = Color.green
        private let noColor = Color.red
        
        @State private var decisionState: DecisionState = .inactive
        @State private var decisionProgress: CGFloat = 0.0
        @State private var lineReachingProgress: CGFloat = 0.0
        @State private var textScaleEffect: CGFloat = 1.0
    }
}


// MARK: - Static Properties
extension ExampleView {
    static let buttonSpinAnimationDuration: TimeInterval = 1.74
    
    
    static let lineReachAnimationDuration: TimeInterval = 0.44685
    static let lineReachAnimationDelay: TimeInterval =
        buttonSpinAnimationDuration +
        (Durations.sequenceMicroDelay * 2.2)
    
    
    static let textBounceAnimationDuration: TimeInterval = 0.43
    static let textBounceAnimationDelay: TimeInterval =
        lineReachAnimationDelay +
        lineReachAnimationDuration
    
    
    static let buttonSpinAnimation = Animation
        .linear(duration: buttonSpinAnimationDuration)
    
    
    static let lineReachAnimation = Animation
        .easeOut(duration: lineReachAnimationDuration)
    
    static let textBounceAnimation = Animation
        .easeInOut(duration: textBounceAnimationDuration)
}


// MARK: - `View` Body
extension ExampleView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            yesSection
            decisionButtonSection
            noSection
        }
        .padding(.vertical)
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - Computeds
extension ExampleView {
    
    var isShowingLineToYes: Bool {
        [.reachedYes, .reachingToYes].contains(decisionState)
    }
    
    var isShowingLineToNo: Bool {
        [.reachedNo, .reachingToNo].contains(decisionState)
    }
    
    var yesTextColor: Color {
        decisionState == .reachedYes ? yesColor : .gray
    }
    
    var noTextColor: Color {
        decisionState == .reachedNo ? noColor : .gray
    }
    
    var yesTextScale: CGFloat {
        decisionState == .reachedYes ? textScaleEffect : 1.0
    }
    
    var noTextScale: CGFloat {
        decisionState == .reachedNo ? textScaleEffect : 1.0
    }
    
    
    var decisionButtonTextColor: Color {
        switch decisionState {
        case .deciding,
             .inactive:
            return .accentColor
        case .reachedYes,
             .reachingToYes:
            return yesColor
        case .reachedNo,
             .reachingToNo:
            return noColor
        }
    }
    
    var decisionRingSize: CGFloat {
        min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 0.33
    }
}


// MARK: - View Variables
private extension ExampleView {
    
    
    //    var descriptionSection: some View {
    //        VStack(spacing: 12) {
    //            Text(titleText)
    //                .textStyle(TitleTextStyle())
    //
    //            Text(subtitleText)
    //                .textStyle(SubtitleTextStyle())
    //
    //            BannerTextView(
    //                text: descriptionText1,
    //                textColor: .white,
    //                backgroundColor: .purple,
    //                font: horizontalSizeClass == .regular ? .largeTitle : .title
    //            )
    //        }
    //    }
    
    
    var decisionButtonSection: some View {
        ZStack {
            decisionButton
            decisionLoaderRing
        }
        .frame(width: decisionRingSize, height: decisionRingSize)
    }
    
    
    var decisionLoaderRing: some View {
        ProgressRingView(
            progress: decisionProgress,
            strokeWidth: loaderCircleLineWidth,
            fillColor: decisionButtonTextColor
        )
        .hueRotation(.radians(2.0 * .pi * Double(decisionProgress)))
    }
    
    
    var decisionButton: some View {
        Button(action: makeDecision) {
            Image(systemName: "questionmark")
                .font(.system(size: 60))
                .hueRotation(.radians(2.0 * .pi * Double(decisionProgress)))
                .foregroundColor(decisionButtonTextColor)
                .padding()
        }
        .disabled(decisionState == .deciding)
        .clipShape(Circle())
    }
    
    
    var yesSection: some View {
        VStack(spacing: 15) {
            Text("YES")
                .font(.system(size: 64, weight: .semibold, design: .rounded))
                .foregroundColor(yesTextColor)
                .scaleEffect(yesTextScale)
            
            ProgressBarView(
                progress: lineReachingProgress,
                barWidth: decisionLineWidth,
                trackColor: .clear,
                fillColor: yesColor
            )
            .opacity(isShowingLineToYes ? 1.0 : 0.0)
            
            Spacer()
        }
    }
    
    
    var noSection: some View {
        VStack(spacing: 15) {
            Spacer()
            
            ProgressBarView(
                progress: lineReachingProgress,
                barWidth: decisionLineWidth,
                trackColor: .clear,
                fillColor: noColor
            )
            .rotationEffect(.radians(.pi))
            .opacity(isShowingLineToNo ? 1.0 : 0.0)
            
            
            Text("NO")
                .font(.system(size: 64, weight: .semibold, design: .rounded))
                .foregroundColor(noTextColor)
                .scaleEffect(noTextScale)
        }
    }
}


// MARK: - Private Helpers
private extension ExampleView {
    
    func makeDecision() {
        let decisionValue = Int.random(in: 0...1)
        
        withAnimation(Animation.default) {
            decisionState = .deciding
            decisionProgress = 0.0
            lineReachingProgress = 0.0
        }
        
        
        withAnimation(Self.buttonSpinAnimation) {
            decisionProgress = 1.0
        }
        
        
        // MARK: - withAnimation Approach
        //
        // 📝 Seems unreliable for animating the same state property
        // multiple times (Xcode 12.3, macOS 11.0.1)
//
//        withAnimation(
//            Self.lineReachAnimation.delay(Self.lineReachAnimationDelay)
//        ) {
//            decisionState = decisionValue == 1 ? .reachingToYes : .reachingToNo
//            lineReachingProgress = 1.0
//        }
//
//        withAnimation(
//            Self.textBounceAnimation.delay(Self.textBounceAnimationDelay)
//        ) {
//            decisionState = decisionValue == 1 ? .reachedYes : .reachedNo
//            textScaleEffect = 1.4
//        }
//
//        withAnimation(
//            Self.textBounceAnimation.delay(
//                Self.textBounceAnimationDelay + Durations.sequenceMicroDelay
//            )
//        ) {
//            textScaleEffect = 1.0
//        }
        

        // MARK: - withAnimation Nested Inside of DispatchQueue.main.async Approach
        
        DispatchQueue.main.asyncAfter(
            deadline: .now() + Self.lineReachAnimationDelay
        ) {
            withAnimation(Self.lineReachAnimation) {
                self.decisionState = decisionValue == 1 ? .reachingToYes : .reachingToNo
                self.lineReachingProgress = 1.0
            }
        }

        
        DispatchQueue.main.asyncAfter(
            deadline: .now() + Self.textBounceAnimationDelay
        ) {
            withAnimation(Self.textBounceAnimation) {
                decisionState = decisionValue == 1 ? .reachedYes : .reachedNo
                textScaleEffect = 1.4
            }

            withAnimation {
                textScaleEffect = 1.0
            }
        }
    }
}


// MARK: - DecisionState
private extension ExampleView {
    
    enum DecisionState {
        case inactive
        case deciding
        case reachingToYes
        case reachedYes
        case reachingToNo
        case reachedNo
    }
}



#if DEBUG
// MARK: - Preview
struct WithAnimation_Sequencing_ExampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ExampleView()
        }
    }
}
#endif
