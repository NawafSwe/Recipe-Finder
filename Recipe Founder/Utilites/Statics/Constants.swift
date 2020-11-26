//
//  Constants.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 26/11/2020.
//

import Foundation
import SwiftUI

struct Constants {
    
    /** 
     
     */
    static func hideKeyBoard (){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    static func haptic (type : UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }
    static func impact (style : UIImpactFeedbackGenerator.FeedbackStyle) ->  UIFeedbackGenerator {
        return  UIImpactFeedbackGenerator(style : style)
    }
}
