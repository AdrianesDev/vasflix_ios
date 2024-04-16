//
//  HorizontalPosterCardComponentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 03/04/24.
//

import SwiftUI

struct HorizontalPosterCardComponentView: View {
    let title:String
    let backdropImage:String
    init(title: String, backdropImage: String) {
        self.title = title
        self.backdropImage = backdropImage
    }
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL( string: "https://image.tmdb.org/t/p/original/\(backdropImage)")) { image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
                .frame(width: 310,height: 162)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(title)
                .font(.system(size:16,weight: .bold))
                .foregroundStyle(.white)
                .padding()
        }
            
                        

    }
}

#Preview {
    HorizontalPosterCardComponentView(title: "king kong", backdropImage: "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg")

}
