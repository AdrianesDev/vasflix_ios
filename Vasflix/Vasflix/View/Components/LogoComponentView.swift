//
//  LogoComponentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 02/04/24.
//

import SwiftUI

struct LogoComponentView: View {
    var body: some View {
        VStack {
            Image("vasflixLogo")
                .resizable()
                .frame(width: 145,height: 145)
            Image("VasflixLetter")
                .resizable()
                .frame(width: 164,height: 33)
        }
        
        
    }
}

#Preview {
    LogoComponentView()
}
