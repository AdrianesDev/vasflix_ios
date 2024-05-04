//
//  ReviewMovieView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 23/04/24.
//

import SwiftUI

struct ReviewMovieView: View {
    @State var isFavorite = false
    let title: String
    let date: String
    let description: String
    let category: [Int]
    let image: String
    
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
    
    init(isFavorite: Bool = false, title: String, date: String, description: String, category: [Int],image: String) {
        self.isFavorite = isFavorite
        self.title = title
        self.date = date
        self.description = description
        self.category = category
        self.image = image
    }
    
    var getButtonAction = ButtonActions()
    var body: some View {
        
        VStack(alignment: .leading,spacing: 10) {
            ZStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(image)")) {
                    image in
                    
                    switch image {
                    case .empty:
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.navy)
                                .frame(width: 400,height: 300)
                            ProgressView()
                        }
                    case .success(let imageView):
                        imageView.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400,height: 300)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                    
            }
            VStack(alignment: .leading,spacing: 10) {
                Text(title)
                    .font(.title)
                    .foregroundStyle(.white)
                Text(date)
                    .font(.caption)
                    .foregroundStyle(.white).opacity(0.60)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("( 1.2M )")
                        .font(.caption)
                        .foregroundStyle(.white)
                    
                    Button {
                        if isFavorite{
                            return isFavorite = false
                        }else {
                            isFavorite = true
                        }
                    }label: {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(isFavorite ? .red : .gray)
                    }
                    
                }
                HStack {
                    ForEach(0..<category.count, id: \.self) { genre in
                        Text("\(genreMovie[category[genre]] ?? "Unknow")")
                            .font(.caption)
                            .foregroundStyle(.white)
                            .padding(.horizontal,15)
                            .padding(.vertical,7)
                            .border(.ultraThinMaterial,width: 2)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .background(.navy)
                            
                    }
                }
                Text("Description")
                    .font(.headline)
                    .foregroundStyle(.white)
                ScrollView {
                    Text(description)
                        .font(.system(size: 16))
                    .foregroundStyle(.white)
                }
            }
            .frame(
                 minWidth: 0,
                 maxWidth: .infinity,
                 minHeight: 0,
                 maxHeight: .infinity,
                 alignment: .topLeading
               )
            .padding()
            
            Spacer()
        }
        .background(.navy)
        .ignoresSafeArea()
        
        
        
    }
        
}


#Preview {
    ReviewMovieView(title: "The conjuring", date: "jun 20 2024", description: "Pelicula de terror",category: [98,112],image: "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg")
        
}
