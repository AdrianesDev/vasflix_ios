//
//  TabView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 05/04/24.
//

import SwiftUI

struct InitialView: View {
    
    @State var currenTab: Tab = .home
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $currenTab) {
                    HomeView()
                        .tag(Tab.home)
                        
                    SearchView()
                        .tag(Tab.search)
                        
                    FavoritesView()
                        .tag(Tab.favorite)
                        
                    SettingsView()
                        .tag(Tab.avatar)
                       
                        
                }
            }
            VStack {
                Spacer()
                CustomTabBar(currentTab: $currenTab)
            }
                
                  
           
        }
            
            
            
        
       
                
    }
}

#Preview {
    InitialView()
}
