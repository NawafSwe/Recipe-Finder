//
//  SavedRecipeViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import Foundation
import SwiftUI
final class SavedRecipeViewModel:ObservableObject{
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: [])  var recipes : FetchedResults<Recipe>
    @Published var recipesModel : [RecipeModel] = []
    
    
    @Published var recipe:RecipeModel?{
        didSet{showDetail = true}
    }
    @Published var showDetail = false
    
    
    func initRecipes(){
       
        for recipe in self.recipes{
            self.recipesModel.append(
                RecipeModel(id: Int(recipe.id), title: recipe.title!, image: recipe.image, likes: Int(recipe.likes),
                            vegetarian: recipe.vegetarian, vegan: recipe.vegan, glutenFree: recipe.glutenFree,
                            veryHealthy: recipe.veryHealthy, cookingMinutes: Int(recipe.cookingMinutes),
                            preparationMinutes: Int(recipe.preparationMinutes), healthScore: Int(recipe.healthScore), sourceUrl: recipe.sourceUrl))
            
        }
        
    }
}
