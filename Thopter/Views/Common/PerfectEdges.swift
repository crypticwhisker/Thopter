//
//  PerfectEdges.swift
//  ScryGuy
//
//  Created by Jacobs, Joe on 12/17/25.
//

import SwiftUI

struct PerfectEdges: ViewModifier {
    
    @State private var contentWidth: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .onGeometryChange(for: CGSize.self, of: \.size) {
                self.contentWidth = $0.height
            }
            .cornerRadius(contentWidth / (89 / 3.1)) // 3.1 seems to cut off most slivers
    }
}

extension View {
    func perfectEdges() -> some View {
            modifier(PerfectEdges())
    }
}
