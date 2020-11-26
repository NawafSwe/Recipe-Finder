//
//  RecipeDetailsView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import SwiftUI
struct RecipeDetailsView: View {
    @ObservedObject  var viewModel : RecipeDetailsViewModel
    
    
    var body: some View {
        VStack{
            RecipeImageView(url: viewModel.recipe.image ?? "")
                //            Image("asian-flank-steak")
                //                .resizable()
                .frame(width: 360, height: 200)
                .cornerRadius(40)
            
            VStack {
                Text(viewModel.recipe.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                /// if null do not put it
                Text("\(viewModel.recipe.cookingMinutes ?? 0) min" )
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical,20)
            
            Divider()
            Section(header:Text("Additional info")) {
                HStack (alignment:.center , spacing: 32 ) {
                    VStack{
                        Text("Likes ❤️")
                            .font(.headline)
                        Text("\(viewModel.recipe.likes ?? 0)")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                    VStack{
                        Text("health Score")
                            .font(.headline)
                        Text("\(viewModel.recipe.healthScore ?? 0)")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    
                }
                .font(.body)
                .padding(20)
                
                HStack(spacing:32){
                    RecipeDetailsBooleanView(title: "glutenFree 🫀", value: viewModel.recipe.glutenFree ?? false)
                    
                    RecipeDetailsBooleanView(title: "vegan ☘️", value: viewModel.recipe.vegan ?? false)
                    
                    RecipeDetailsBooleanView(title: "healthy 😇", value: viewModel.recipe.veryHealthy ?? false)
                }
                .padding()
            }
            Button(action:{viewModel.showSafari.toggle()}){
                Text("Click For More Details")
                    .fontWeight(.black)
                    .accentColor(.white)
                    .font(.body)
                    .frame(width: 300,height: 50)
                    .background(Color.healthyColor)
                
            }
            .cornerRadius(20)
            .padding(.top,20)
            .sheet(isPresented: $viewModel.showSafari) {
                SafariView(url: URL(string: viewModel.recipe.sourceUrl ?? "") ??  URL(string:"Not found in case")! )
                
            }
            
            
            Spacer()
        }
        
        .overlay(
            Button(action:{self.viewModel.dismiss.wrappedValue.toggle()}){
                DismissXmarkView(circleWidth: 25, circleHeight: 25)
                
            }
            .padding(.horizontal)
            .padding(.top,10)
            ,alignment: .topLeading)
        .overlay(
            Button(action:{ viewModel.saveRecipe(recipe: viewModel.recipe) }){
                SaveButtonView()
            }
            .alert(item: $viewModel.alertItem){ alert in
                Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
            }
            .padding(.horizontal)
            .padding(.top,10)
            , alignment: .topTrailing
        )
        
    }
}
struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(viewModel: RecipeDetailsViewModel(recipe: MockData.recipeSample,dismiss: .constant(false)))
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
