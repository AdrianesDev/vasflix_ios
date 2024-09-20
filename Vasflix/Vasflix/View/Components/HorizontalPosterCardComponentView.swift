//
//  HorizontalPosterCardComponentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 03/04/24.
//

import SwiftUI

struct HorizontalPosterCardComponentView: View {
    @State var title:String
    @State var backdropImage:String
//    init(title: String, backdropImage: String) {
//        self.title = title
//        self.backdropImage = backdropImage
//    }
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL( string: "https://image.tmdb.org/t/p/original/\(backdropImage)")) { image in
                switch image {
                case .empty:
                    ZStack {
                        Rectangle()
                            .tint(.gray)
                            .frame(width: 310,height: 162)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        ProgressView()
                    }
                case .success(let imageView):
                    imageView
                        .resizable()
                        .scaledToFill()
                        .frame(width: 310,height: 162)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                case .failure:
                    Image(systemName: "photo")
                        .background(.gray)
                        .frame(width: 310,height: 162)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                @unknown default:
                    EmptyView()
                }
            }
            
            
            Text(title)
                .font(.system(size:16,weight: .bold))
                .lineLimit(1)
                .foregroundStyle(.white)
                .shadow(color: .black,radius: 4)
                .padding()
                .frame(width: 310,alignment: .leading)
        }
            
                        

    }
}

#Preview {
    HorizontalPosterCardComponentView(title: "king kong", backdropImage: "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg")

}
