//
//  SavedRecipeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SavedRecipeView: View {
    @State private var recipeList = MockData.recipeList
    var body: some View {
        NavigationView {
            ZStack{
                List{
                    ForEach(recipeList){ recipe in
                        RecipeCellView(recipe: recipe)
                    }
                }
                
                
                if recipeList.isEmpty{
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

