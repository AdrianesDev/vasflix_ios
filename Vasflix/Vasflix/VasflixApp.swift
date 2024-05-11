//
//  VasflixApp.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 02/04/24.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct VasflixApp: App {
    @AppStorage("uid") var userID: String = ""
    
    init(){
        FirebaseApp.configure()
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
    
    var body: some Scene {
        WindowGroup {
            
            if userID == ""{
                ContentView()
            }else {
                InitialView()
                
                
            }
            
                
        }
    }
}
