//
// ScreenSectionDivider.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/5/21.
// ✌️
//

import SwiftUI


struct ScreenSectionDivider {
    var width = CGFloat(100.0)
    var height = CGFloat(1.25)
    var color = Color.pink
}


// MARK: - `View` Body
extension ScreenSectionDivider: View {
    
    var body: some View {
        Divider()
            .frame(width: width, height: height)
            .background(color)
    }
}


// MARK: - Computeds
extension ScreenSectionDivider {
}


// MARK: - View Content Builders
private extension ScreenSectionDivider {
}


// MARK: - Private Helpers
private extension ScreenSectionDivider {
}


#if DEBUG
// MARK: - Preview
struct ScreenSectionDivider_Previews: PreviewProvider {
    
    static var previews: some View {
        ScreenSectionDivider()
    }
}
#endif
