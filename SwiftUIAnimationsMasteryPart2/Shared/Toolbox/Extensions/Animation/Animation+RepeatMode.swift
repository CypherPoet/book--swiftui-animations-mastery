//
// Animation+RepeatMode.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 4/1/21.
// ✌️
//

import SwiftUI


extension Animation {
    public enum RepeatMode: Equatable {
        case times(Int)
        case forever
    }
}


extension Animation.RepeatMode {
    public static var once: Self { .times(1) }
    public static var never: Self { .times(0) }
}
