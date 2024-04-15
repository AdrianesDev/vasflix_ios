//
//  CustomTabBar.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 05/04/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    
    var body: some View {

            HStack(spacing:0.0) {
                ForEach(Tab.allCases, id: \..rawValue){ tab in
                    
                    Button {
                        withAnimation(.easeInOut) {
                            currentTab = tab
                        }
                    }label: {
                        
                        Image(systemName: tab == currentTab ? "\(tab.rawValue).fill" :  "\(tab.rawValue)")
                            .renderingMode(.template)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle( .lightCaribean )
                            .scaleEffect(tab == currentTab ? 1.30 : 1.0)
                            .font(.system(size: 22))
                        
                    }
                    
                        
                        
                }
            }
            
        .frame(maxWidth: .infinity)
        .padding(.top,30)
        .background(.navy.opacity(0.90))
        .background(.ultraThinMaterial.opacity(0.80))

    }
}

#Preview {
    InitialView()
}
