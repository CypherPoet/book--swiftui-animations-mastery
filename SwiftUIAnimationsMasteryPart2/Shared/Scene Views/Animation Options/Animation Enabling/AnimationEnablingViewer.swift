//
// AnimationEnablingViewer.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/6/21.
// ✌️
//

import SwiftUI


struct AnimationEnablingViewer {
}


// MARK: - `View` Body
extension AnimationEnablingViewer: View {

    var body: some View {
        List {
            Section {
                Group {
                    NavigationLink(
                        destination: AnimationEnabling_WatchingAValue_ExampleView()
                    ) {
                        Text("Watching A Value")
                    }
                }
            }
        }
        .navigationTitle("Turning Animations On & Off")
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - Computeds
extension AnimationEnablingViewer {
}


// MARK: - View Content Builders
private extension AnimationEnablingViewer {
}


// MARK: - Private Helpers
private extension AnimationEnablingViewer {
}


#if DEBUG
// MARK: - Preview
struct AnimationEnablingViewer_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            AnimationEnablingViewer()
        }
    }
}
#endif
