//
//  SearchView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 05/04/24.
//

import SwiftUI

struct SearchView: View {
    @State var discoverMovies: [Discover] = []
    @State private var searchMovie: String = ""
    
    var filterMovies: [Discover] {
        guard !searchMovie.isEmpty else {return discoverMovies}
        return discoverMovies.filter {$0.title.localizedCaseInsensitiveContains(searchMovie)}
    }
    var body: some View {
        
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]) {
                    ForEach(filterMovies, id: \.id) { discoverMovie in
                        
                        NavigationLink(destination: ReviewMovieView(title: discoverMovie.title, date: discoverMovie.releaseDate, description: discoverMovie.overview, category: discoverMovie.genreIDS, image: discoverMovie.backdropPath ?? "")) {
                            VerticalPosterCardComponentView(posterImage: discoverMovie.posterPath, popularity: discoverMovie.popularity, titleMovie: discoverMovie.title, category: discoverMovie.genreIDS)
                                
                        }
                        
                        
                    }
                }
                
            }
            .background(.navy)
            .searchable(text: $searchMovie,placement: .navigationBarDrawer(displayMode: .always))
            .safeAreaInset(edge: .bottom, content:  {
                Color.clear
                    .frame(height: 70)
            })
        }
        
        
        .task {
            do {
                discoverMovies = try await getDiscoverMovies()
            }
            catch ErrorCoding.invalidURL{
                print("Invalid URL")
            } catch ErrorCoding.invalidResponse {
                print("Invalid Response")
            } catch ErrorCoding.invalidData(let error) {
                print("Invalid Data \(error)")
            } catch {
                print("unexpeted Error")
            }
        }
        
        
        
    }
}

#Preview {
    SearchView()
}
