//
// ScreenBannerViewModifier.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/5/21.
// ✌️
//

import SwiftUI


struct ScreenBannerViewModifier {
    var textColor: Color
    var backgroundColor: Color
    var font: Font
    
    @ScaledMetric private var baseFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
}


// MARK: - Animatable Data
extension ScreenBannerViewModifier {
}


// MARK: - ViewModifier
extension ScreenBannerViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(font)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(baseFontSize * 0.9)
            .background(
                backgroundColor
                    .cornerRadius(baseFontSize * 0.9)
                    .blur(radius: 6.0)
            )
    }
}


#if DEBUG
// MARK: - Preview
struct ScreenBannerViewModifier_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
#endif
