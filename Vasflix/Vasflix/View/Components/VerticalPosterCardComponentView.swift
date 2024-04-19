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
    let category: [Int]
    
    var genreMovie = [
       
        28:"Action",
        12:"Adventure",
        16: "Animation",
        35: "Comedy",
        80: "Crime",
        99: "Documentary",
        18: "Drama",
        10751: "Family",
        14: "Fantasy",
        36: "History",
        27: "Horror",
        10402: "Music",
        9648: "Mystery",
        10749: "Romance",
        878: "Science Fiction",
        10770: "TV Movie",
        53: "Thriller",
        10752: "War",
        37: "Western"
           
    ]
    
    init(
    posterImage: String,
    popularity: Double,
    titleMovie: String,
    category: [Int]
    
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
                

                Text("\(genreMovie[category[0]] ?? "Unknow")")
                            .font(.system(size: 12,weight: .light))
                            .frame(width: 122,alignment: .leading)
                            .foregroundStyle(.white.opacity(0.60))

            }
            
        }
    }
}

#Preview {
    VerticalPosterCardComponentView(
        posterImage: "/iq1t8MxKDkKuV1WqyOr2RQM0hIA.jpg", popularity: 2, titleMovie: "Star wars", category: [878,12]
    )
    .background(.navy)
        
}
