//
//  RecipeCellView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI
//MARK:- RecipeCellView
struct RecipeCellView:View{
    let recipe:RecipeModel
    
    var body: some View{
        HStack(spacing:10){
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100)
                .cornerRadius(10)
            Text(recipe.title)
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                
        }
    }
}

struct RecipeCellView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCellView(recipe: MockData.recipeSample)
    }
}
