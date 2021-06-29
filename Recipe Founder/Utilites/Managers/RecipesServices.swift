//
//  RecipesServices.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import Foundation
import UIKit
/// singleton design
final class RecipeServices {
    static let sheared = RecipeServices()
    static let baseURL = Constants.API_HOST
    static let endpoint = "spoon"
    private let fullURL = baseURL+"/"+endpoint
    
    /// `caching pictures and getting images from spoon api`
    /// we are passing the each pair key `<NSString,UIImage>`
    /// `caching images` we want to cache images to avoid downloading images every time `NSString` is the identifier
    /// and the `UIImage`  is the value of the image
    private let cache = NSCache<NSString,UIImage>()
    
    private init(){}
    
    /// fetching recipes from server
    func fetchRecipes(ingredients : [String] , completion: @escaping (Result<[RecipeModel],NetworkErr>) ->Void ){
        /// making sure the ingredients list is not empty
        if ingredients.isEmpty{
            completion(.failure(.emptyBody))
            return
        }
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
            let body  = ["ingredients":ingredients,"number": 15] as [String : Any]
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
    /// getting image  from the server
    func getImage(url: String , completion: @escaping  (UIImage?) ->Void){
        
        /// checking the url is valid url
        guard let safeUrl = URL(string:url) else {
            /// no image because the url is not valid
            completion(nil)
            return
        }
        
        /// url valid then we will do a network call to get the image from the server
        
        let task = URLSession.shared.dataTask(with: safeUrl) { (data, response, error) in
            /// we do not care here for error or response status because we do not have alerts and such error handling
            /// if there is an error or problem just place a placeholder image
            guard let data = data ,let image = UIImage(data: data) else{
                completion(nil)
                return
            }
            /// return the image
            completion(image)
            return
        }
        /// starting the network call
        task.resume()
    }
    
}
