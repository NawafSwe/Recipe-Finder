//
//  SearchRecipeViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI

final class SearchRecipeViewModel: ObservableObject{
    @Published var isShowForm = false
    @Published var ingredients : [IngredientInput] = []
    @Published var ingredientInput:String = ""
    @Published var recipes:[RecipeModel] = []
    @Published var showResults  = false
    @Published var alertItem:AlertItem? = nil
    @Published var isLoading  = false
    var ingredientsStrings:[String] { ingredients.map {$0.name} }
    
    func fetchRecipes(ingredients:[String] ) -> Void {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            RecipeServices.sheared.fetchRecipes(ingredients: ingredients) {   result in
                self.isLoading = false
                DispatchQueue.main.async {
                    switch result{
                        case .success(let recipes):
                            self.recipes = recipes
                            self.showResults = true
                           
                        case .failure(let error):
                            switch error {
                                case .invalidData:
                                    self.alertItem = AlertContext.invalidData
                                case .invalidURL:
                                    self.alertItem = AlertContext.invalidURL
                                case .invalidResponse:
                                    self.alertItem = AlertContext.invalidResponse
                                case .unComplete:
                                    self.alertItem = AlertContext.unComplete
                                case .emptyBody:
                                    self.alertItem = AlertContext.emptyBody
                            }
                    }
                }
            }
            
        }
    }
    func addIngredients(_ name:String)->Void{
        ingredients.append(IngredientInput(name: name))
    }
    
    func removeIngredient(at index: IndexSet) -> Void{
        ingredients.remove(atOffsets: index)
    }
}
