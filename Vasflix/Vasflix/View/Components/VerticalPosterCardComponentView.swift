//
//  VerticalPosterCardComponentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 04/04/24.
//

import SwiftUI

struct VerticalPosterCardComponentView: View {
    var body: some View {
        VStack(alignment: .leading) {
           
            ZStack(alignment: .bottomLeading) {
                Image("stwPoster")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 122,height: 152)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                HStack(spacing:0) {
                    ForEach(0..<6){ star in
                        Image(systemName: "star")
                            .foregroundStyle(.black)
                            .font(.system(size: 10))
                            
        
                    }
                    Spacer()
                        .frame(width: 2)
                    Text("( 0 )")
                        .font(.system(size: 10,weight: .semibold))
                        .foregroundStyle(.black)
                }
                .padding(4)
                .background(.ultraThinMaterial.opacity(0.90))
                .clipShape(Capsule())
                .padding([.leading,.bottom],8)
                
                
            }
            
            VStack(alignment: .leading) {
                Text("Star Wars: Rogue one")
                    .font(.system(size: 12,weight: .semibold))
                    .fixedSize(horizontal: false, vertical: false)
                    .lineLimit(1)
                    .foregroundStyle(.white)
                Text("Action")
                    .font(.system(size: 12,weight: .light))
                    .foregroundStyle(.white.opacity(0.60))
            }
            
        }
    }
}

#Preview {
    VerticalPosterCardComponentView()
        .background(.navy)
        
}
