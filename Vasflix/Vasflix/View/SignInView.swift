//
//  SignInView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 03/04/24.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var isVisiblePassword: Bool = false
    @AppStorage("uid") var userID: String = ""
    
    private func showPassword() -> Void {
        
        if isVisiblePassword {
             return isVisiblePassword = false
        }
        
        return isVisiblePassword = true
    }
    
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
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .foregroundStyle(.white.opacity(0.70))
                        
                }
                
                VStack(alignment:.trailing) {
                    VStack(alignment: .leading,spacing: 5) {
                        Text("Email")
                            .font(.system(size: 15))
                            .foregroundStyle(.white)
                        TextField("", text: $emailText,prompt: Text("Enter your email").foregroundStyle(.gray) )
                            .foregroundStyle(.black)
                            .textInputAutocapitalization(.never)
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
                            if isVisiblePassword {
                                TextField("", text: $passwordText,prompt: Text("Enter your password").foregroundStyle(.gray) )
                                    .foregroundStyle(.black)
                                    .textInputAutocapitalization(.never)
                            }
                            else {
                                SecureField("Enter your password", text: $passwordText,prompt: Text("Enter your password").foregroundStyle(.gray) )
                                    .foregroundStyle(.black)
                                    .textInputAutocapitalization(.never)
                            }
                            
                            Button {
                                showPassword()
                            }label: {
                                Image(systemName: isVisiblePassword ?  "eye.fill" : "eye.slash.fill")
                                    .tint(.black)
                            }

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
                Button{
                    Auth.auth().signIn(withEmail: emailText, password: passwordText) { authResult, error in
                        
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        if let authResult = authResult {
                            withAnimation {
                                userID = authResult.user.uid
                            }
                        }
                }
                }label: {
                    
                        
                        Text("Log in")
                            .font(.system(size: 16 ,weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 263,height: 55)
                            .background(RoundedRectangle(cornerRadius: 10))
                            .buttonStyle(.borderedProminent)
                            .tint(.caribean)

                    
                }
                
                Spacer()
                
                
            }
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
