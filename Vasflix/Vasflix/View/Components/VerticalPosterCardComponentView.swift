//
//  VerticalPosterCardComponentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 04/04/24.
//

import SwiftUI

struct VerticalPosterCardComponentView: View {
    let posterImage: String
    var popularity: Double
    let titleMovie: String
    let category: String
    
    init(
    posterImage: String,
    popularity: Double,
    titleMovie: String,
    category: String
    ) {
        self.category = category
        self.popularity = popularity
        self.posterImage = posterImage
        self.titleMovie = titleMovie
    }
    var body: some View {
        VStack(alignment: .leading) {
           
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL( string: "https://image.tmdb.org/t/p/original/\(posterImage)")) { image in
                    image.resizable()
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 122,height: 152)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                
                HStack(spacing:0) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.system(size: 10))
                            
                    Spacer()
                        .frame(width: 2)
                    Text("( \(popularity.formatted(.number.precision(.fractionLength(1)))) )")
                        .font(.system(size: 10,weight: .semibold))
                        .foregroundStyle(.white)
                }
                .padding(4)
                .background(.ultraThinMaterial.opacity(0.90))
                .clipShape(Capsule())
                .padding([.leading,.bottom],8)
                
                
            }
            
            VStack(alignment: .leading) {
                Text(titleMovie)
                    .font(.system(size: 12,weight: .semibold))
                    .fixedSize(horizontal: false, vertical: false)
                    .frame(width: 122,alignment: .leading)
                    .lineLimit(1)
                    .foregroundStyle(.white)
                    
                Text(category)
                    .font(.system(size: 12,weight: .light))
                    .frame(width: 122,alignment: .leading)
                    .foregroundStyle(.white.opacity(0.60))
            }
            
        }
    }
}

#Preview {
    VerticalPosterCardComponentView(
    posterImage: "/iq1t8MxKDkKuV1WqyOr2RQM0hIA.jpg", popularity: 2, titleMovie: "Star wars", category: "Action"
    )
    .background(.navy)
        
}
