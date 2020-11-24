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
}
extension  AlertContext{
    static let invalidData = AlertItem(message: Text("Server Error"), title: Text("The Server Cannot process your request if the problem persist please contact the developer team "), dismissButton: .default(Text("OK")) )
    
    static let unComplete = AlertItem(message: Text("Server Error"), title: Text("Please Check Your internet connection"), dismissButton: .default(Text("OK")) )
    
    static let invalidURL = AlertItem(message: Text("Server Error"), title: Text("The Server Cannot process your request if the problem persist please contact the developer team "), dismissButton: .default(Text("OK")) )
    
    static let invalidResponse = AlertItem(message: Text("Server Error"), title: Text("The Server Cannot process your request if the problem persist please contact the developer team "), dismissButton: .default(Text("OK")) )
    
    
}
