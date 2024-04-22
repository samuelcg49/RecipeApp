//
//  RoundedColorButton.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import Foundation
import SwiftUI

struct RoundedColorButton: ViewModifier{
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.horizontal)
            .background(color)
            .cornerRadius(24)
            .padding(.horizontal, 24)
    }
}
