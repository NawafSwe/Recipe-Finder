//
//  RecipeResultsView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI

struct RecipeResultsView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(MockData.recipeList){recipe in
                    RecipeCellView(recipe: recipe)
                }
            }
            .navigationBarTitle("Recipes Result 🧾☕️")
        }
    }
}
struct RecipeResultsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeResultsView()
    }
}
