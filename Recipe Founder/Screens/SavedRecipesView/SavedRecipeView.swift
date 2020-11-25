//
//  SavedRecipeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SavedRecipeView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var recipeList = MockData.recipeList
    @StateObject private var viewModel = SavedRecipeViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                List{
                    ForEach(viewModel.recipes){ recipe in
                        RecipeCellView(recipe:  MockData.recipeSample)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.viewModel.recipe = MockData.recipeSample
                                }
                            }
                    }
                }.onAppear{ viewModel.initRecipes() }
                /// changing style list
                .listStyle(PlainListStyle())
                
                
                if viewModel.recipesModel.isEmpty{
                    EmptySavedRecipesStateView()
                    
                }
                
                if viewModel.showDetail{
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

