//
//  ContentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 02/04/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

struct ContentView: View {
    @AppStorage("uid") var userID: String = ""
    var body: some View {
        
        NavigationStack {
            ZStack{
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
                    NavigationLink(destination: SignInView()) {
                        NavigationButtonComponentView(
                            label: "Sign In",
                            backgroundColor: .caribeanColor,
                            action: SignInView() )
                    }
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
                    Button {
                        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                        
                        // Create Google Sign In configuration object.
                        let config = GIDConfiguration(clientID: clientID)
                        GIDSignIn.sharedInstance.configuration = config
                        
                        // Start the sign in flow!
                        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) {  result, error in
                            guard error == nil else {
                                // ...
                                return
                            }
                            
                            guard let user = result?.user,
                                  let idToken = user.idToken?.tokenString
                            else {
                                // ...
                                return
                            }
                            
                            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                           accessToken: user.accessToken.tokenString)
                            
                            //Auth
                            Auth.auth().signIn(with: credential) { authResult, error in
                                
                                if let error = error {
                                    print(error)
                                    return
                                }
                                
                                if let authResult = authResult {
                                    withAnimation {
                                        userID = authResult.user.uid
                                    }
                                }
                                
                                // ...
                            }
                        }
                    }label: {
                        HStack {
                            
                           
                                Image("google")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                            
                            
                            Text("Sign in with Google")
                                .font(.system(size: 16 ,weight: .bold))
                                .foregroundStyle(.black)
                                
                                
                        }
                        .frame(width: 263,height: 55)
                        .background(RoundedRectangle(cornerRadius: 10))
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                    }
                    
                    Spacer()
                    
                    
                }
                
                
                
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}

