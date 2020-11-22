//
//  RecipeDetailsView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import SwiftUI
struct RecipeDetailsView: View {
    let recipe:RecipeModel
    @Binding var dismiss:Bool
    @State private var showSafari = false
    
    var body: some View {
        VStack{
            RecipeImageView(url: recipe.image ?? "")
                .frame(width: 320, height: 200)
                .cornerRadius(32)
                
            VStack {
                Text(recipe.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                /// if null do not put it
                Text("\(recipe.cookingMinutes ?? 0) min" )
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical,20)
            
            Divider()
            Section(header:Text("Statistics")) {
                HStack (alignment:.center , spacing: 32 ) {
                    VStack{
                        Text("Likes ❤️")
                            .font(.headline)
                        Text("\(recipe.likes ?? 0)")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                    VStack{
                        Text("health Score")
                            .font(.headline)
                        Text("\(recipe.healthScore ?? 0)")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }.padding()
                    
                }
                .font(.body)
                .padding(20)
                
                HStack(spacing:32){
                    RecipeDetailsBooleanView(title: "glutenFree 🫀", value: recipe.glutenFree ?? false)
                    
                    RecipeDetailsBooleanView(title: "vegan ☘️", value: recipe.vegan ?? false)
                    
                    RecipeDetailsBooleanView(title: "healthy 😇", value: recipe.veryHealthy ?? false)
                }
                .padding()
            }
            Button(action:{showSafari.toggle()}){
                Text("Click For More Details")
                    .fontWeight(.black)
                    .accentColor(.white)
                    .font(.body)
                    .frame(width: 300,height: 50)
                    .background(Color.tabItemColor)
                
            }
            .cornerRadius(20)
            .padding(.top,20)
            .sheet(isPresented: $showSafari) {
                SafariView(url: URL(string: recipe.sourceUrl ?? "") ??  URL(string:"Not found in case")! )
                    
            }
            
            
            Spacer()
        }
        
        .overlay(
            Button(action:{self.dismiss.toggle()}){
                DismissXmarkView()
                
            }
            .padding(.horizontal)
            ,alignment: .topLeading)
        .overlay(
            Button(action:{}){
                Image(systemName: "heart")
                    .renderingMode(.original)
                    .frame(width:44 , height: 44)
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            , alignment: .topTrailing
        )
        
    }
}
struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipe: MockData.recipeSample,dismiss: .constant(false))
    }
}

struct RecipeDetailsBooleanView:View{
    let title : String
    let value: Bool
    var body: some View{
        VStack{
            Text("\(title)")
            Text(value ? "Yes" : "NO")
        }
    }
}
