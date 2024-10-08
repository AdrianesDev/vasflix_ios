//
//  HomeView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 03/04/24.
//

import SwiftUI
struct scrollPreKey : PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct HomeView: View {
    @State var isScroll = false
    @State var popularMovie: [Result] = []
    @State var topRatedMovie: [TopRated] = []
    @State var upcomingMovie: [UpcomingMovies] = []
    @State var nowPlayingMovie: [NowPlayingMovie] = []
    @State var genre: [Genre] = []
    @StateObject var movieService = GetApiDataViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                GeometryReader { proxy in
                    Color.clear.preference(key: scrollPreKey.self, value: proxy.frame(in: .named("scroll")).minY)
                    
                }
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 30){
                        ForEach(nowPlayingMovie, id: \.id) { nowPlaying in
                            NavigationLink(destination: ReviewMovieView(title: nowPlaying.title, date: nowPlaying.releaseDate, description: nowPlaying.overview,category: nowPlaying.genreIDS,image: nowPlaying.backdropPath ?? "")) {
                                HorizontalPosterCardComponentView(title: nowPlaying.title, backdropImage: nowPlaying.backdropPath ?? "")
                            }
                        }
                        
                    }
                    .padding(.horizontal,25)
                }
                
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                
                Spacer()
                    .frame(height: 30)
                //MARK: - popular movies
                VStack(alignment: .leading, spacing: 15) {
                    Text("Trending now")
                        .font(.system(size: 20,weight: .medium))
                        .padding(.leading,25)
                        .foregroundStyle(.white)
                    
                    
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .center, spacing: 15){
                            ForEach(popularMovie, id: \.id) { popular  in
                                NavigationLink(destination: ReviewMovieView(title: popular.title, date: popular.releaseDate, description: popular.overview, category: popular.genreIDS, image: popular.backdropPath ?? "")) {
                                    VerticalPosterCardComponentView(
                                        posterImage: popular.posterPath, popularity: popular.voteAverage, titleMovie: popular.title,
                                        category: popular.genreIDS)
                                }
                            }
                        }
                        .padding(.horizontal,25)
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    
                    
                }//: VSTACK
                
                Spacer()
                    .frame(height: 30)
                
                VStack(alignment: .leading) {
                    Text("Top Rated")
                        .font(.system(size: 20,weight: .medium))
                        .padding(.leading,25)
                        .foregroundStyle(.white)
                    ScrollView(.horizontal) {
                        HStack(alignment: .center, spacing: 15){
                            ForEach(topRatedMovie, id: \.id) {topRated in
                                NavigationLink(destination: ReviewMovieView(title: topRated.title, date: topRated.releaseDate, description: topRated.overview, category: topRated.genreIDS, image: topRated.backdropPath ?? "") ) {
                                    VerticalPosterCardComponentView(posterImage: topRated.posterPath, popularity: topRated.voteAverage, titleMovie: topRated.title, category: topRated.genreIDS)
                                }
                            }
                        }
                        .padding(.horizontal,25)
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    
                } //: VSTACK
                
                
                Spacer()
                    .frame(height: 30)
                
                VStack(alignment: .leading) {
                    Text("Upcoming movies")
                        .font(.system(size: 20,weight: .medium))
                        .padding(.leading,25)
                        .foregroundStyle(.white)
                    ScrollView(.horizontal) {
                        HStack(alignment: .center, spacing: 15){
                            ForEach(upcomingMovie, id: \.id) {upcoming in
                                NavigationLink(destination: ReviewMovieView(title: upcoming.title, date: upcoming.releaseDate, description: upcoming.overview, category: upcoming.genreIDS, image: upcoming.backdropPath ?? "")) {
                                    VerticalPosterCardComponentView(
                                        posterImage: upcoming.posterPath,
                                        popularity: upcoming.voteAverage,
                                        titleMovie: upcoming.title,
                                        category: upcoming.genreIDS)
                                }
                            }
                        }
                        .padding(.horizontal,25)
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    
                    
                } //: VSTACK
                
            } //: SCROLL VIEW
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .task {
                do {
                   
                    popularMovie = try await movieService.getPopularMovies()
                    topRatedMovie = try await movieService.getTopRatedMovies()
                    upcomingMovie = try await movieService.getUpcomingMovies()
                    nowPlayingMovie = try await movieService.getNowPlayingMovie()
                    genre = try await movieService.getMovieGenderList()
                    
                } catch ErrorCoding.invalidURL{
                    print("Invalid URL")
                } catch ErrorCoding.invalidResponse {
                    print("Invalid Response")
                } catch ErrorCoding.invalidData(let error) {
                    print("Invalid Data \(error)")
                } catch {
                    print("unexpeted Error")
                }
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(scrollPreKey.self, perform: { value in
                withAnimation(.default) {
                    if value < 0 {
                        isScroll = true
                    }else {
                        isScroll = true
                    }
                }
            })
            .safeAreaInset(edge: .top, content:  {
                Color.clear
                    .frame(height: 30)
            })
            .safeAreaInset(edge: .bottom, content:  {
                Color.clear
                    .frame(height: 70)
            })
            .background(.navy)
            .overlay {
                ZStack {
                    Color.clear
                        .frame(height: isScroll ? 90 : 100)
                        .background(.navy.opacity(0.90))
                        .background(.ultraThinMaterial.opacity(0.80))
                        .opacity(isScroll ? 1 : 0)
                        .blur(radius: 0.5)
                        .edgesIgnoringSafeArea(.top)
                    
                    Image("VasflixLetter")
                        .resizable()
                        .frame(width: 100, height: 20)
                        .padding(.bottom,50)
                        .offset(y: isScroll ? -10 : -15)
                    
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                
                
            }
        } //: NAVIGATION STACK
        
        
    }
    
    
}

#Preview {
    HomeView()
}
