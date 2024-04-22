//
//  ContentView.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @StateObject var viewModel = ContentViewModel()
    @State private var isVstackVisible = true
    
    var body: some View {
        VStack{
            if isVstackVisible {
                VStack {
                    Image("recipe")
                        .resizable()
                        .frame(height: 400)
                    
                    VStack{
                        Text("Start Cooking")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Let's join our community \n to cook better food!")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button{
                        isPresented.toggle()
                        UserDefaults.standard.set(true, forKey: "onBoarding")
                    }label: {
                        Text("Get started")
                            .modifier(RoundedColorButton(color: .green))
                    }
                    
                    Spacer()
                    
                        .fullScreenCover(isPresented: $isPresented, content: {
                            LoginView()
                        })
                    
                }.padding()
            }else {
                Group{
                    if viewModel.userSession != nil {
                        RecipeTabView()
                        
                    }else{
                        LoginView()
                    }
                }
            }
        }
        .onAppear(perform: {
            if UserDefaults.standard.bool(forKey: "onBoarding"){
                isVstackVisible = false
            }
        })
    }
   
}

#Preview {
    ContentView()
}
