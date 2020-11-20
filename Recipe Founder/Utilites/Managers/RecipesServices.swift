//
//  RecipesServices.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import Foundation

final class RecipeServices {
    static let sheared = RecipeServices()
    static let baseURL = "https://spoon-groc.herokuapp.com/"
    static let endpoint = "spoon/searchByIngredients"
    
    private init(){}
    
    func fetchRecipes(ingredients : [String] , completion: @escaping (Result<IngredientInput,Error>) ->Void ){
        
        
    }
}
