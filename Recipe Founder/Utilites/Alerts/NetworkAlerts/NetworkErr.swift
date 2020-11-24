//
//  NetworkErr.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import Foundation
import SwiftUI
enum NetworkErr:Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unComplete
    case emptyBody
}
extension  AlertContext{
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The Server Cannot process your request if the problem persist please contact the developer team "), dismissButton: .default(Text("OK")) )
    
    static let unComplete = AlertItem(title: Text("Server Error"), message: Text("Please Check Your internet connection"), dismissButton: .default(Text("OK")) )
    
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("The Server Cannot process your request if the problem persist please contact the developer team "), dismissButton: .default(Text("OK")) )
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("The Server Cannot process your request if the problem persist please contact the developer team "), dismissButton: .default(Text("OK")) )
    
    static let emptyBody = AlertItem(title: Text("User Error"), message: Text("Please Fill ingredients to search for Recipes"), dismissButton: .default(Text("OK")))
}
