//
//  Constants.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 26/11/2020.
//

import Foundation
import SwiftUI

struct Constants {
    
    static let devAccount = URL(string:"https://twitter.com/Nawaf_B_910")!
    static let API_HOST = "http://grocipe-app.herokuapp.com"
    
    
    /// hide keyboard function
    static func hideKeyBoard (){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    /// function to generate haptic feed back to the user when he clicks a button
    /// - Parameter type: type of haptic feed back
    static func haptic (type : UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }
    
    /// give user an impact when he clicks a button
    /// - Parameter style: style of the impact
    /// - Returns: returns a ui feed back
    static func impact (style : UIImpactFeedbackGenerator.FeedbackStyle) ->  UIFeedbackGenerator {
        return  UIImpactFeedbackGenerator(style : style)
    }
}
