//
//  TextViewModifier.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import Foundation
import SwiftUI

struct TextViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(.systemGray3), lineWidth: 1)
                    .padding(.horizontal, -12)
            )
            .padding(.horizontal, 24)
    }
}
