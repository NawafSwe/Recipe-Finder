//
//  SavedRecipeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SavedRecipeView: View {
    @StateObject private var viewModel = SavedRecipeViewModel()
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: [])  var recipes : FetchedResults<Recipe>
    var body: some View {
        NavigationView {
            ZStack{
                List{
                    ForEach(recipes){ recipe in
                        RecipeCellView(recipe: RecipeModel(managedRecipe: recipe) )
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.viewModel.recipe = RecipeModel(managedRecipe: recipe)
                                }
                            }
                    }
                }
                /// changing style list
                .listStyle(PlainListStyle())
                
                
                if recipes.isEmpty{
                    EmptySavedRecipesStateView()
                    
                }
                
                if viewModel.showDetail{
                    Color(.systemBackground)
                        .edgesIgnoringSafeArea(.all)
                    RecipeDetailsView(recipe: viewModel.recipe ?? MockData.recipeSample, dismiss: $viewModel.showDetail)
                }
                
            }
            
            .navigationBarTitle("Saved Recipes 🧾")
        }
    }
}

struct SavedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipeView()
    }
}

