//
// AnimationOptions_CheckYourUnderstandingViewer.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/22/21.
// ✌️
//

import SwiftUI


struct AnimationOptions_CheckYourUnderstandingViewer {
}


// MARK: - `View` Body
extension AnimationOptions_CheckYourUnderstandingViewer: View {

    var body: some View {
        List {
            NavigationLink(
                destination: Example1View(),
                label: {
                    Text("Check Understanding 1")
                }
            )
            
            NavigationLink(
                destination: Example2View(),
                label: {
                    Text("Check Understanding 2")
                }
            )
        }
    }
}


// MARK: - Computeds
extension AnimationOptions_CheckYourUnderstandingViewer {
}


// MARK: - View Content Builders
private extension AnimationOptions_CheckYourUnderstandingViewer {
}


// MARK: - Private Helpers
private extension AnimationOptions_CheckYourUnderstandingViewer {
}


#if DEBUG
// MARK: - Preview
struct AnimationOptions_CheckYourUnderstandingViewer_Previews: PreviewProvider {

    static var previews: some View {
        AnimationOptions_CheckYourUnderstandingViewer()
    }
}
#endif
