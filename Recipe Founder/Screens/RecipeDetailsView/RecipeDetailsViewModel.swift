//
//  RecipeDetailsViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import Foundation
import SwiftUI

final class RecipeDetailsViewModel:ObservableObject{
    @Environment(\.managedObjectContext)  private var moc
    @Published var showSafari = false
    @Published var alertItem:AlertItem? = nil
    
    
    
    func saveRecipe(recipe: RecipeModel?){
        guard let safeRecipe = recipe else {
            return }
        do{
            /// making core recipe refers to the moc where to safe
            let coreRecipe = Recipe(context: self.moc)
            coreRecipe.id = Int16(safeRecipe.id)
            coreRecipe.title = safeRecipe.title
            coreRecipe.sourceUrl = safeRecipe.sourceUrl
            coreRecipe.cookingMinutes = Int16(safeRecipe.cookingMinutes ?? 0)
            coreRecipe.glutenFree = safeRecipe.glutenFree ?? false
            coreRecipe.vegan = safeRecipe.vegan ?? false
            coreRecipe.vegetarian = safeRecipe.vegetarian ?? false
            coreRecipe.healthScore = Int16(safeRecipe.healthScore ?? 0)
            coreRecipe.preparationMinutes = Int16(safeRecipe.preparationMinutes ?? 0)
            coreRecipe.likes = Int16(safeRecipe.likes ?? 0)
            coreRecipe.image = safeRecipe.image ?? nil
            coreRecipe.veryHealthy = safeRecipe.veryHealthy ?? false
            try moc.save()
            
        }catch let error {
            print(error)
            return
        }
    }
}
