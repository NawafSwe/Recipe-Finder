//
//  RecipeResultsView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI

struct RecipeResultsView: View {
    @ObservedObject var viewModel = RecipeResultViewModel()
    @Binding var dissmiss:Bool
    @Binding var recipes : [RecipeModel]
    
    var body: some View {
        ZStack{
            NavigationView {
                List{
                    ForEach(recipes){recipe in
                        RecipeCellView(recipe: recipe)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.viewModel.recipe = recipe
                                }
                            }
                    }
                    
                }
                .listStyle(PlainListStyle())
                .navigationBarItems(leading: Button(action:{ self.dissmiss.toggle()})
                    {DismissXmarkView(circleWidth: 30, circleHeight: 25)})
                .navigationBarTitle("Recipes Result 🧾☕️")
            }
   
            
            if(viewModel.showDetail){
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                RecipeDetailsView(recipe: viewModel.recipe!,dismiss: $viewModel.showDetail)
                
            }
            
        }
    }
}
struct RecipeResultsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeResultsView(dissmiss: .constant(false), recipes: .constant(MockData.recipeList))
    }
}
