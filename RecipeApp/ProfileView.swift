//
//  ProfileView.swift
//  RecipeApp
//
//  Created by Samuel Cíes Gracia on 22/4/24.
//

import SwiftUI

enum ProfileFilter: Int, Codable, Identifiable, CaseIterable {
    case recipes
    case liked
    
    var title: String{
        switch self{
        case .recipes:
            return "recipes"
        case .liked:
            return "liked"
        }
    }
    var id: Int { return self.rawValue}
}

struct ProfileView: View {
    @State private var selectedFilter: ProfileFilter = .recipes
    @Namespace var animation
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    private var filterBarWidth: CGFloat{
        let count = CGFloat(ProfileFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Image("avatar")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                    Text("Samuel Cíes")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                
                //Estadísticas
                HStack(spacing: 36){
                    VStack{
                        Text("32")
                            .fontWeight(.semibold)
                        
                        Text("Recipes")
                            .font(.footnote)
                    }
                    VStack{
                        Text("712")
                            .fontWeight(.semibold)
                        
                        Text("Following")
                            .font(.footnote)
                    }
                    VStack{
                        Text("553")
                            .fontWeight(.semibold)
                        
                        Text("Followers")
                            .font(.footnote)
                    }
                }
                .foregroundColor(Color(.systemGray4))
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 6)
                    .foregroundColor(Color(.systemGray6))
                
                //Segmented control
                VStack{
                    HStack{
                        ForEach(ProfileFilter.allCases){ filter in
                            VStack{
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter{
                                    Rectangle()
                                        .frame(width: filterBarWidth, height: 1)
                                        .foregroundColor(.black)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                }else{
                                    Rectangle()
                                        .frame(width: filterBarWidth, height: 1)
                                        .foregroundColor(.clear)
                                }
                            }.onTapGesture {
                                withAnimation{
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 20)
                //Content
                LazyVGrid(columns: gridItemLayout){
                    ForEach(0...10, id: \.self){ recipe in
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray)
                            .background(Color(.systemGray3))
                        
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        AuthService.shared.signOut()
                    }label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.gray)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView()
}
