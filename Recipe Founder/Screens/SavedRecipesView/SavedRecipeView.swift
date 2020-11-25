//
//  SavedRecipeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SavedRecipeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: []) var recipes : FetchedResults<Recipe>
    @State private var recipeList = MockData.recipeList
    var body: some View {
        NavigationView {
            ZStack{
                List{
                    ForEach(recipes){ recipe in
                        CoreRecipeCell(recipe: recipe)
                    }
                }
                /// changing style list
                .listStyle(PlainListStyle())
                
                
                if recipes.isEmpty{
                    EmptySavedRecipesStateView()
                    
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

