//
//  SettingsView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 05/04/24.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @AppStorage("uid") var userID: String = ""
    var body: some View {
        ZStack {
            Color.navy
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Button {
                    let firebaseAuth = Auth.auth()
                    
                    do {
                        try firebaseAuth.signOut()
                        withAnimation(.bouncy, {
                            userID = ""
                        })
                        
                        
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                }label: {
                    HStack {
                        
                       
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .foregroundStyle(.white)
                                .frame(width: 24,height: 24)
                        
                        
                        Text("Log out")
                            .font(.system(size: 16 ,weight: .bold))
                            .foregroundStyle(.white)
                            
                            
                    }
                    .frame(width: 263,height: 55)
                    .background(RoundedRectangle(cornerRadius: 10))
                    .buttonStyle(.borderedProminent)
                    .tint(.errorRed)
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SettingsView()
}
