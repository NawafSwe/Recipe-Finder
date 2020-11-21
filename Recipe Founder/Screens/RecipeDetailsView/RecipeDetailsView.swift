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
                .frame(width: 220, height: 200)
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
            .padding()
            
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
                    VStack{
                        Text("glutenFree 🫀")
                        Text( (recipe.glutenFree ?? false) ? "Yes" : "NO"  )
                    }
                    
                    VStack{
                        Text("vegan ☘️")
                        Text( (recipe.vegan ?? false) ? "Yes" : "NO"  )
                    }
                    
                    VStack{
                        Text("healthy 😇")
                        Text( (recipe.veryHealthy ?? false) ? "Yes" : "NO"  )
                    }
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
            .padding()
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
