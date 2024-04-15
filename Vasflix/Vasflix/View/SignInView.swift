//
//  SignInView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 03/04/24.
//

import SwiftUI

struct SignInView: View {
    @State var emailText: String = ""
    @State var passwordText: String = ""
    var body: some View {
        ZStack {
            Color.navyColor
            VStack {
                Spacer()
                VStack(spacing: 17) {
                    Image("vasflixLogo")
                        .resizable()
                    .frame(width: 100,height: 100)
                    Image("VasflixLetter")
                        .resizable()
                        .frame(width: 100,height: 20)
                }
                Spacer()
                    .frame(height: 60)
                VStack {
                    Text("Welcome Back")
                        .font(.system(size: 40,weight: .bold))
                        .foregroundStyle(.white)
                    Text("Please inter your details.")
                        .font(.system(size: 15))
                        .foregroundStyle(.white.opacity(0.70))
                        
                }
                
                VStack(alignment:.trailing) {
                    VStack(alignment: .leading,spacing: 5) {
                        Text("Email")
                            .font(.system(size: 15))
                            .foregroundStyle(.white)
                        TextField("Enter your email", text: $emailText )
                            .padding(.vertical,15)
                            .padding(.horizontal,12)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                    }
                    
                    Spacer()
                        .frame(height: 25)
                    
                    VStack(alignment: .leading,spacing: 5) {
                        Text("Password")
                            .font(.system(size: 15))
                            .foregroundStyle(.white)
                        HStack {
                            TextField("Enter your password", text: $passwordText )
                            Image(systemName: "eye.fill")

                        }
                        .padding(.vertical,15)
                        .padding(.horizontal,12)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                    }
                    
                    Text("Forgot Your password?")
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                }
                .padding()
                Spacer()
                NavigationButtonComponentView(
                    label: "Log in",
                    backgroundColor: .caribeanColor,
                    action: InitialView()
                )
                Spacer()
                
                
            }
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
