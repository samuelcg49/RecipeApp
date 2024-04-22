//
//  LoginView.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    @State var isShowingPassword: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16){
                Text("Welcome Back!")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Please enter your account here")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    
                VStack(spacing: 20){
                    HStack{
                        Image(systemName: "envelope")
                            .fontWeight(.semibold)
                        
                        TextField("Email", text: $viewModel.email)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                        
                    }
                    .modifier(TextViewModifier())
                    
                    HStack{
                        Image(systemName: "lock")
                            .fontWeight(.semibold)
                        
                        if isShowingPassword {
                            TextField("Password", text: $viewModel.password)
                                .font(.subheadline)
                                .padding(12)
                                .cornerRadius(12)
                        } else{
                            SecureField("Password", text: $viewModel.password)
                                .font(.subheadline)
                                .padding(12)
                                .cornerRadius(12)
                        }
                        
                        Button{
                            isShowingPassword.toggle()
                        }label: {
                            Image(systemName: isShowingPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        
                    }
                    .modifier(TextViewModifier())
                    
                    HStack{
                        Spacer()
                        
                        Button(action:{
                                //Forgot password
                        }, label: {
                            Text("Forgot Password?")
                                .foregroundStyle(.black)
                        })
                    }
                    .padding(.trailing, 24)
                }
                
                //Login buttons
                VStack(spacing: 16){
                    Button(action: {
                        Task{
                            try await viewModel.login()
                        }
                    }, label: {
                        Text("Login")
                            .modifier(RoundedColorButton(color: .green))
                    })
                    
                    Text("Or continue with")
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Google")
                            .modifier(RoundedColorButton(color: .orange))
                    })
                    
                    NavigationLink{
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        HStack{
                            Text("Don't have an account?")
                            
                            Text("Sign Up")
                                .foregroundStyle(.green)
                                .fontWeight(.semibold)
                            
                        }
                        .foregroundColor(.black)
                        .font(.footnote)
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
