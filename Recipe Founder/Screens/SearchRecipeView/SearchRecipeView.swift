//
//  SearchRecipeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SearchRecipeView: View {
    @Binding var dismissView : Bool
    @State var showForm = false
   
    var body: some View {
        ZStack {
            NavigationView{
                List{
                    Text("Hi")
                    Text("Hi")
                    Text("Hi")
                    Text("Hi")
                }
                .listStyle(InsetGroupedListStyle())
                    
                    .navigationBarTitle("Search Recipes ☘️")
                    .navigationBarItems(leading:horizontalButtonContainers(showForm: $showForm) ,trailing:
                                            Button{
                                                /// dismiss from the view
                                                self.dismissView.toggle()
                                            }label:{
                                                DismissXmarkView()
                                            })
            }
            .disabled(showForm)
            .blur(radius: showForm ? 5 : 0)
            
            if showForm{
                InputSearchView(dismissView: $showForm)
                    .transition(.identity)
            }
        }
    }
}
struct SearchRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipeView(dismissView:.constant(false))
            .preferredColorScheme(.dark)
    }
}

 //MARK:- horizontalButtonContainers
struct horizontalButtonContainers: View{
    @Binding var showForm : Bool
    var body: some View{
        HStack{
            Button{
                /// do search
            }
            label:{
                MagnifyButton()
                
            }
            Button{
                /// show view to fill name of ingredient
                self.showForm.toggle()
                
            }
            label:{
                PlusButton()
                
                
            }
        }
    }
}
