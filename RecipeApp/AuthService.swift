//
//  AuthService.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("Debug: Usuario logeado \(result.user.uid)")
        }catch{
            print("Debug error \(error.localizedDescription)")
        }
    }

    
    @MainActor
    func createUser(email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Debug: Usuario creado \(result.user.uid)")
        }catch{
            print("Debug error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
