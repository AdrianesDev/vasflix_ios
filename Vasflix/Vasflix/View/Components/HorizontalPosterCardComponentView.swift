//
//  HorizontalPosterCardComponentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 03/04/24.
//

import SwiftUI

struct HorizontalPosterCardComponentView: View {
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            Image("GODZILLA-VS-KONG")
                .resizable()
                .frame(width: 310,height: 162)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text("Godzila vs Kong")
                .font(.system(size:16,weight: .bold))
                .foregroundStyle(.white)
                .padding()
        }
            
                        

    }
}

#Preview {
    HorizontalPosterCardComponentView()

}
