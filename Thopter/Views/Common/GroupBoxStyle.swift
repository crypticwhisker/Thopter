//
//  GroupBoxStyle.swift
//  Thopter
//
//  Created by Jacobs, Joe on 8/3/26.
//

import Foundation
import SwiftUI

struct GBOutsideLabel: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        Group {
            configuration.label
                .font(.headline)
                .foregroundStyle(.secondary)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                configuration.content
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

extension GroupBoxStyle where Self == GBOutsideLabel {
    static var outsideLabel: GBOutsideLabel { .init() }
}
