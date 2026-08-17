//
//  Stretchy.swift
//  Thopter
//
//  Created by Jacobs, Joe on 8/3/26.
//

import Foundation
import SwiftUI

// https://nilcoalescing.com/blog/StretchyHeaderInSwiftUI/

extension View {
    func stretchy() -> some View {
        visualEffect { effect, geometry in
            let currentHeight = geometry.size.height
            let scrollOffset = geometry.frame(in: .scrollView).minY
            let positiveOffset = max(0, scrollOffset)
            
            let newHeight = currentHeight + positiveOffset
            let scaleFactor = newHeight / currentHeight
            
            return effect.scaleEffect(
                x: scaleFactor, y: scaleFactor,
                anchor: .bottom
            )
        }
    }
}
