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
        ZStack {
            NavigationView{
                List{
                    ForEach(recipes){ recipe in
                        RecipeCellView(recipe: RecipeModel(managedRecipe: recipe) )
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.viewModel.recipe = RecipeModel(managedRecipe: recipe)
                                }
                            }
                    }
                    .onDelete(perform:deleteRecipe)
                }
                
                /// changing style list
                .listStyle(PlainListStyle())
                /// indicates the delete operation of a recipe
                .alert(item: $viewModel.alertItem){alert in
                    Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
                }
                
                
                
                .navigationBarTitle("Saved Recipes 🧾")
                .navigationBarItems(leading: EditButton())
                
            }
            if recipes.count == 0{
                EmptySavedRecipesStateView()
                
            }
            
            if viewModel.showDetail{
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                RecipeDetailsView(viewModel: RecipeDetailsViewModel(recipe: viewModel.recipe ?? MockData.recipeSample, dismiss: $viewModel.showDetail))
            }
        }
    }
    
    func deleteRecipe(at offsets: IndexSet) {
        for offset in offsets {
            // find this recipe in our fetch request
            let recipe = recipes[offset]
            // delete it from the context
            viewModel.core.context.delete(recipe)
        }
        do{
            // save the context
            try viewModel.core.context.save()
            DispatchQueue.main.async{
                viewModel.alertItem = AlertContext.successDelete
            }
            
        }catch _ {
            DispatchQueue.main.async{viewModel.alertItem = AlertContext.unableToDelete}
            
        }
    }
}
struct SavedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipeView()
    }
}
