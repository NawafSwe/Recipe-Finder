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
                RecipeCellView(recipe: MockData.recipeSample)
                RecipeCellView(recipe: MockData.recipeSample)
                RecipeCellView(recipe: MockData.recipeSample)
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
