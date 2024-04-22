//
//  RegistrationView.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    
    @State var isShowingPassword: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var isPasswordValidLength: Bool {
        return viewModel.password.count >= 6
    }
    
    var isPasswordWithNumber: Bool{
        return viewModel.password.contains(where: {$0.isNumber})
    }
    
    var isPasswordWithUpperCase: Bool {
        return viewModel.password.contains(where: {$0.isUppercase})
    }
    
    var isPasswordWithLowerCase: Bool {
        return viewModel.password.contains(where: {$0.isLowercase})
    }
    
    var isPasswordValid: Bool{
        return isPasswordWithNumber && isPasswordValidLength && isPasswordWithLowerCase && isPasswordWithUpperCase
    }
    
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16){
                Text("Welcome!")
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
                    
                    VStack(spacing: 26){
                        Text("Your password must contain:")
                        VStack{
                            HStack{
                                Image(systemName: isPasswordValidLength ? "checkmark.circle.fill" : "checkmark.circle")
                                    .foregroundColor(isPasswordValidLength ? .green : .gray)
                                Text("Atleast 6 characters")
                            }
                            HStack{
                                Image(systemName: isPasswordWithNumber ? "checkmark.circle.fill" : "checkmark.circle")
                                    .foregroundColor(isPasswordWithNumber ? .green : .gray)
                                Text("Contains a number")
                            }
                            HStack{
                                Image(systemName: isPasswordWithUpperCase ? "checkmark.circle.fill" : "checkmark.circle")
                                    .foregroundColor(isPasswordWithUpperCase ? .green : .gray)
                                Text("Atleast one uppercase letter")
                            }
                            HStack{
                                Image(systemName: isPasswordWithLowerCase ? "checkmark.circle.fill" : "checkmark.circle")
                                    .foregroundColor(isPasswordWithLowerCase ? .green : .gray)
                                Text("Atleast one lowercase letter")
                            }
                        }
                    }
                }
                
                //Login buttons
                VStack(spacing: 16){
                    Button(action: {
                        Task{
                            try await viewModel.createUser()
                        }
                    }, label: {
                        Text("Sign Up")
                            .modifier(RoundedColorButton(color: .green))
                    })
                    .opacity(isPasswordValid ? 1: 0.5)
                    .disabled(!isPasswordValid)
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack{
                            Text("Already have an account?")
                            
                            Text("Login")
                                .foregroundStyle(.green)
                                .fontWeight(.semibold)
                            
                        }
                        .foregroundColor(.black)
                        .font(.footnote)
                        
                    })
                }
            }
            .padding(.vertical, 50)
        }
    }
}


#Preview {
    RegistrationView()
}
