//
//  SettingView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SettingView: View {
    @State private var showSafari = false
    @State private var showAccountSetting = false
    var body: some View {
            NavigationView {
                Form {
                    Section(header:Text("General Settings")){
                        
                        Button{
                            showAccountSetting.toggle()
                            
                        }label:{ SettingCellView(imageName: "person.crop.circle", title: "Account") }
                        .sheet(isPresented: $showAccountSetting){
                            AccountView(dismiss: $showAccountSetting)
                        }
                        
                        Button{ showSafari.toggle()
                        }label:{ SettingCellView(imageName: "message", title: "Contact Developer")
                        }
                        .sheet(isPresented: $showSafari){
                            SafariView(url:URL(string:"https://twitter.com/Nawaf_B_910")!)
                        }
                    }
                    .accentColor(.black)
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
//MARK:- SettingCellView
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
