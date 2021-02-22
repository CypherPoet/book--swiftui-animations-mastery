//
// CenteredViewModifier.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/22/21.
// ✌️
//

import SwiftUI


struct CenteredViewModifier {
    var alignment: AlignmentKind
}


// MARK: - ViewModifier
extension CenteredViewModifier: ViewModifier {

    @ViewBuilder
    func body(content: Content) -> some View {
        switch alignment {
        case .horizontally:
            HStack {
                Spacer()
                content
                Spacer()
            }
        case .vertically:
            VStack {
                Spacer()
                content
                Spacer()
            }
        }
    }
}

extension CenteredViewModifier {
    
    enum AlignmentKind {
        case horizontally
        case vertically
    }
}


#if DEBUG
// MARK: - Preview
struct CenteredViewModifier_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
#endif
