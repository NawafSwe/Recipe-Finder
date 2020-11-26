//
//  RemoteImageView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import Foundation
import SwiftUI
import UIKit
final class ImageLoader: ObservableObject{
    @Published var image : Image? = nil
    
    
    
    func fetchImage(url:String){
        RecipeServices.sheared.getImage(url: url) { uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImageView:View{
    var image : Image?
    var body: some View{
        
        image?.resizable() ?? Image(Images.emptyRecipe).resizable()
        
        
        
    }
}


struct RecipeImageView:View{
    @StateObject private var loader = ImageLoader()
    let url:String
    var body: some View{
        
        RemoteImageView(image: loader.image)
            .onAppear{
                loader.fetchImage(url: url)
            }
    }
}
