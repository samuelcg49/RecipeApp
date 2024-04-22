//
//  ContentView.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
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
            }label: {
                Text("Get started")
                    .modifier(RoundedColorButton(color: .green))
            }
            
            Spacer()
            
                .fullScreenCover(isPresented: $isPresented, content: {
                    LoginView()
                })
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
