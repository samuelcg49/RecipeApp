//
//  ContentViewModel.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

class ContentViewModel: ObservableObject{
    //Recibir la sesión del usuario desde el auth service
    
    @Published var userSession: FirebaseAuth.User?
    
    private var cancelables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    func setupSubscribers(){
        AuthService.shared.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancelables)
    }
}
