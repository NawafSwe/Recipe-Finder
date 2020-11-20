//
//  RecipeModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import Foundation
//MARK:- RecipeModel:Codable
struct RecipeModel : Codable {
    var id:Int
    var title:String
    var image:String?
    var likes:Int
    var vegetarian:Bool?
    var vegan:Bool?
    var glutenFree:Bool?
    var veryHealthy:Bool?
    var cookingMinutes:Int?
    var preparationMinutes:Int?
    var healthScore:Int?
    var sourceUrl:String?
    var nutrition: Nutrition?
}
//MARK:- Nutrition:Codable
struct Nutrition:Codable{
    var nutrients : [Nutrient]?
    
}
//MARK:- Nutrient:Codable
struct Nutrient:Codable{
    var title: String
    var amount: Double
    var unit:String
}
