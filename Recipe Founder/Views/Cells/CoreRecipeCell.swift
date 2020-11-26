//
//  CoreRecipeCell.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import SwiftUI

struct CoreRecipeCell: View {
    let recipe:Recipe
        var body: some View{
            HStack(spacing:10){
                RecipeImageView(url:recipe.image ?? "")
                 //.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100)
                    .cornerRadius(10)
                    
                Text(recipe.title ?? "empty")
                    .font(.body)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                    
            }
        
    }
}

struct CoreRecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        CoreRecipeCell(recipe: Recipe())
    }
}
