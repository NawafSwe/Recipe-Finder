//
//  RecipeResultsView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI

struct RecipeResultsView: View {
    @StateObject var viewModel = RecipeResultViewModel()
    @Binding var dissmiss:Bool
    var body: some View {
        ZStack{
            NavigationView {
                List{
                    ForEach(MockData.recipeList){recipe in
                        RecipeCellView(recipe: recipe)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.viewModel.recipe = recipe
                                }
                            }
                    }
                    
                }
                .navigationBarItems(leading: Button(action:{ self.dissmiss.toggle()})
                    {DismissXmarkView()})
                .navigationBarTitle("Recipes Result 🧾☕️")
            }
            //            .disabled(viewModel.showDetail)
            //            .shadow(radius: viewModel.showDetail ? 40 : 0 )
            //            .blur(radius: viewModel.showDetail ? 10 : 0)
            
            if(viewModel.showDetail){
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                RecipeDetailsView(recipe: viewModel.recipe!,dismiss: $viewModel.showDetail)
                    .transition(.move(edge: .top))
            }
            
        }
    }
}
struct RecipeResultsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeResultsView(dissmiss: .constant(false))
    }
}
