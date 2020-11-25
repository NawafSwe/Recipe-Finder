//
//  RecipeModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import Foundation
import CoreData
//MARK:- RecipeModel:Codable
struct RecipeModel : Codable, Identifiable {
    var id: Int
    var title:String
    var image:String?
    var likes:Int?
    var vegetarian:Bool?
    var vegan:Bool?
    var glutenFree:Bool?
    var veryHealthy:Bool?
    var cookingMinutes:Int?
    var preparationMinutes:Int?
    var healthScore:Int?
    var sourceUrl:String?
    
}

//MARK:- Extension RecipeModel make it from core data into valid struct
extension RecipeModel{
    init(managedRecipe: NSManagedObject){
        self.id = managedRecipe.value(forKey: "id") as! Int
        self.title = managedRecipe.value(forKey: "title") as! String
        self.image = managedRecipe.value(forKey: "image") as? String
        self.likes = managedRecipe.value(forKey: "likes") as? Int
        self.vegetarian = managedRecipe.value(forKey: "vegetarian") as? Bool
        self.glutenFree = managedRecipe.value(forKey: "glutenFree") as? Bool
        self.cookingMinutes = managedRecipe.value(forKey: "cookingMinutes") as? Int
        self.preparationMinutes = managedRecipe.value(forKey: "preparationMinutes") as? Int
        self.healthScore = managedRecipe.value(forKey: "healthScore") as? Int
        self.sourceUrl = managedRecipe.value(forKey: "sourceUrl") as? String
        
        
    }
    
}


//MARK:- MOCKData
//MARK:- JSON Response From server
//[
//    {
//        "id": 68463,
//        "title": "Calzones",
//        "image": "https://spoonacular.com/recipeImages/68463-312x231.jpg",
//        "likes": 357,
//        "vegetarian": false,
//        "vegan": false,
//        "glutenFree": false,
//        "veryHealthy": false,
//        "healthScore": 21,
//        "sourceUrl": "http://www.thekitchn.com/thekitchn/how-to/how-to-make-calzones-and-freeze-them-for-later-151276"
//    },
//    {
//        "id": 719320,
//        "title": "20 Celebration ! + $500 GIVEAWAY",
//        "image": "https://spoonacular.com/recipeImages/719320-312x231.png",
//        "likes": 105,
//        "vegetarian": false,
//        "vegan": false,
//        "glutenFree": true,
//        "veryHealthy": false,
//        "healthScore": 3,
//        "sourceUrl": "http://www.julieseatsandtreats.com/20-celebration-recipes/"
//    },
//    {
//        "id": 83391,
//        "title": "Easy Tip To Freezing Bacon: How-to",
//        "image": "https://spoonacular.com/recipeImages/83391-312x231.jpg",
//        "likes": 1,
//        "vegetarian": false,
//        "vegan": false,
//        "glutenFree": true,
//        "veryHealthy": false,
//        "healthScore": 0,
//        "sourceUrl": "http://www.recklessabandoncook.com/2011/12/easy-tip-to-freezing-bacon-how-to.html"
//    },
//    {
//        "id": 525301,
//        "title": "Easy 3 Ingredient Slow Cooker Chicken",
//        "image": "https://spoonacular.com/recipeImages/525301-312x231.jpg",
//        "likes": 724,
//        "vegetarian": false,
//        "vegan": false,
//        "glutenFree": true,
//        "veryHealthy": false,
//        "preparationMinutes": 5,
//        "cookingMinutes": 240,
//        "healthScore": 11,
//        "sourceUrl": "http://simple-nourished-living.com/2013/10/easy-3-ingredient-slow-cooker-chicken/"
//    },
//    {
//        "id": 524924,
//        "title": "Slow Cooker Pulled Pork Loin with Applesauce",
//        "image": "https://spoonacular.com/recipeImages/524924-312x231.jpg",
//        "likes": 560,
//        "vegetarian": false,
//        "vegan": false,
//        "glutenFree": true,
//        "veryHealthy": false,
//        "preparationMinutes": 10,
//        "cookingMinutes": 6,
//        "healthScore": 10,
//        "sourceUrl": "http://simple-nourished-living.com/2013/08/slow-cooker-pulled-pork-loin-with-applesauce-recipe/"
//    },
//    {
//        "id": 525683,
//        "title": "Frontera Beef Barbacoa Slow-Cooking Sauce",
//        "image": "https://spoonacular.com/recipeImages/525683-312x231.jpg",
//        "likes": 116,
//        "vegetarian": false,
//        "vegan": false,
//        "glutenFree": true,
//        "veryHealthy": false,
//        "preparationMinutes": 10,
//        "cookingMinutes": 480,
//        "healthScore": 9,
//        "sourceUrl": "http://simple-nourished-living.com/2013/12/frontera-beef-barbacoa-slow-cooking-sauce/"
//    },
//    {
//        "id": 525039,
//        "title": "Easy 3-Ingredient Slow Cooker BBQ Smokies",
//        "image": "https://spoonacular.com/recipeImages/525039-312x231.jpg",
//        "likes": 70,
//        "vegetarian": false,
//        "vegan": false,
//        "glutenFree": true,
//        "veryHealthy": false,
//        "preparationMinutes": 5,
//        "cookingMinutes": 120,
//        "healthScore": 0,
//        "sourceUrl": "http://simple-nourished-living.com/2014/02/easy-slow-cooker-bbq-smokies/"
//    },
//    {
//        "id": 524928,
//        "title": "3-Ingredient Crock Pot Salsa Verde Beef",
//        "image": "https://spoonacular.com/recipeImages/524928-312x231.jpg",
//        "likes": 61,
//        "vegetarian": false,
//        "vegan": false,
//        "glutenFree": true,
//        "veryHealthy": false,
//        "preparationMinutes": 10,
//        "cookingMinutes": 480,
//        "healthScore": 32,
//        "sourceUrl": "http://simple-nourished-living.com/2014/05/crock-pot-salsa-verde-beef/"
//    }
//]


struct MockData {
    static let recipeSample = RecipeModel(id: 809320, title: "Balsamic Roast Beef French Dip Sandwich", image: "https://spoonacular.com/recipeImages/809320-312x231.jpg", likes: 562312, vegetarian: false, vegan: false, glutenFree: false, veryHealthy: false, cookingMinutes: 10, preparationMinutes: 0, healthScore: 12, sourceUrl: "http://addapinch.com/cooking/balsamic-roast-beef-french-dip-sandwich-recipe/")
    
    static let recipeList  = [
        
        RecipeModel(id: 793712, title: "Easy Meat Lover’s Pizza", image:  "https://spoonacular.com/recipeImages/793712-312x231.jpg", likes: 96, vegetarian: false, vegan: false, glutenFree: false, veryHealthy: false, cookingMinutes: 10, preparationMinutes: 0, healthScore: 31, sourceUrl: "http://www.afamilyfeast.com/easy-meat-lovers-pizza/"),
        
        RecipeModel(id: 809320, title: "Balsamic Roast Beef French Dip Sandwich", image: "https://spoonacular.com/recipeImages/809320-312x231.jpg", likes: 394, vegetarian: false, vegan: false, glutenFree: false, veryHealthy: true, cookingMinutes: 10, preparationMinutes: 0, healthScore: 12, sourceUrl: "http://addapinch.com/cooking/balsamic-roast-beef-french-dip-sandwich-recipe/"),
        
        
        RecipeModel(id: 524928, title: "3-Ingredient Crock Pot Salsa Verde Beef", image:   "https://spoonacular.com/recipeImages/524928-312x231.jpg", likes: 96, vegetarian: false, vegan: false, glutenFree: false, veryHealthy: false, cookingMinutes: 10, preparationMinutes: 0, healthScore: 31, sourceUrl: "http://www.afamilyfeast.com/easy-meat-lovers-pizza/"),
        
        RecipeModel(id: 802320, title: "Balsamic Roast Beef French Dip Sandwich", image: "https://spoonacular.com/recipeImages/809320-312x231.jpg", likes: 61, vegetarian: false, vegan: false, glutenFree: false, veryHealthy: false, cookingMinutes: 480, preparationMinutes: 0, healthScore: 32, sourceUrl: "http://simple-nourished-living.com/2014/05/crock-pot-salsa-verde-beef/")
        
    ]
}
