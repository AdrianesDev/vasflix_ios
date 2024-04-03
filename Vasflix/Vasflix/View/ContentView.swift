//
//  ContentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            Image("backgrounLogin")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            Color.black
                .opacity(0.70)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                Spacer()
                .frame(height: 85)
                LogoComponentView()
                    Spacer()
                    .frame(height: 85)
                ButtonComponentView(
                    label: "Sing In",
                    backgroundColor: .caribeanColor,
                    action: {})
                ButtonComponentView(
                    label: "Sing Up",
                    backgroundColor: .navyColor,
                    action: {})
                HStack(alignment: .center){
                    Color.white
                        .frame(width: 107, height: 1.5)
                    Text("or")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                    Color.white
                        .frame(width: 107, height: 1.5)
                        
                }
                .padding(.horizontal,10)
                ButtonComponentView(
                    label: "Sing in with Google",
                    labelColor: .black,
                    iconImage: "google",
                    action: {})
                Spacer()
                
                
            }
            
            
            
        }
        
        
    }
}

#Preview {
    ContentView()
}

