//
//  RegistrationViewModel.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import Foundation

class RegistrationViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func createUser() async throws{
        try await AuthService.shared.createUser(email: email, password: password)
    }
    
}
