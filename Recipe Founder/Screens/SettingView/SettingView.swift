//
//  SettingView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("General Settings")){
                    NavigationLink(destination:Text("Account view")){
                        SettingCellView(imageName: "person.crop.circle", title: "Account")
                        
                    }
                    
                    NavigationLink(destination:Text("Contact US")){
                        SettingCellView(imageName: "message", title: "Contact Developer")
                        
                    }
                    
                    
                    
                }
                Section{
                    Button{ }label:{
                        SettingCellView(imageName: "wifi.slash", title: "Logout")
                    }
                    .accentColor(.red)
                }
                
            }
            .navigationBarTitle("Setting ✈️")
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct SettingCellView :View{
    let imageName:String
    let title:String
    var body: some View{
        HStack(spacing:10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width:28, height: 28)
            
            
            
            Text(title)
                .font(.title3)
                .font(.system(size:16))
        }
    }
}
