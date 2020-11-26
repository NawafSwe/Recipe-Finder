//
//  RecipeResultsView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI

struct RecipeResultsView: View {
    @ObservedObject var viewModel : RecipeResultViewModel
    
    
    var body: some View {
        ZStack{
            NavigationView {
                List{
                    /// wrappedValue to take the recipes value 
                    ForEach(viewModel.recipes.wrappedValue){recipe in
                        RecipeCellView(recipe: recipe)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.viewModel.recipe = recipe
                                }
                            }
                    }
                    
                }
                .listStyle(PlainListStyle())
                .navigationBarItems(leading: Button(action:{ viewModel.dismiss.wrappedValue.toggle()})
                    {DismissXmarkView(circleWidth: 30, circleHeight: 25)})
                .navigationBarTitle("Recipes Result 🧾☕️")
            }
            
            
            if(viewModel.showDetail){
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                RecipeDetailsView(viewModel: RecipeDetailsViewModel(recipe: viewModel.recipe!,dismiss: $viewModel.showDetail))
                
            }
            
        }
    }
}
struct RecipeResultsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeResultsView(viewModel: RecipeResultViewModel(dismiss: .constant(false), recipes: .constant(MockData.recipeList)))
            .colorScheme(.dark)
    }
}
