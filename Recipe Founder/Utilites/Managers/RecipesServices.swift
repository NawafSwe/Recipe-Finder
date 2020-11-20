//
//  RecipesServices.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import Foundation
/// singleton design
final class RecipeServices {
    static let sheared = RecipeServices()
    static let baseURL = "https://spoon-groc.herokuapp.com/"
    static let endpoint = "spoon/recipes"
    private let fullURL = baseURL+endpoint
    
    private init(){}
    
    /// fetching recipes from server
    func fetchRecipes(ingredients : [String] , completion: @escaping (Result<[RecipeModel],NetworkErr>) ->Void ){
        /// setting the url
        guard let url = URL(string: fullURL ) else{
            completion(.failure(.invalidURL))
            return
        }
        
        /// creating new request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        /// encoder to encode data
        do{
            /// JSONSerialization for body
            let body  = ["ingredients":ingredients,"number": 50] as [String : Any]
            request.httpBody = try JSONSerialization.data(withJSONObject: body,options: [.prettyPrinted])
            
        }catch _ {
            completion(.failure(.unComplete))
            return
        }
        ///setting new task to start a http request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            /// checking for errors
            if let _ = error {
                completion(.failure(.unComplete))
                return
            }
            /// checking response
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                
                completion(.failure(.invalidResponse))
                return
            }
            
            /// checking data
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            /// decode data
            do{
                let recipes = try JSONDecoder().decode([RecipeModel].self, from: data)
                print(recipes)
                /// returning recipes
                completion(.success(recipes))
                return
            }catch let error{
                print("cannot parse \n \(error)")
                completion(.failure(.invalidData))
                return
            }
        }
        
        /// starting the task
        task.resume()
        
    }
}
