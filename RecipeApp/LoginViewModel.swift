//
//  LoginViewModel.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws{
        try await AuthService.shared.login(email: email, password: password)
    }
}
