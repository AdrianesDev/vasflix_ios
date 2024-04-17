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
    var body: some View {
        
        ScrollView {
            GeometryReader { proxy in
                Color.clear.preference(key: scrollPreKey.self, value: proxy.frame(in: .named("scroll")).minY)
                
            }
            ScrollView(.horizontal) {
                HStack(alignment: .center, spacing: 30){
                    ForEach(nowPlayingMovie, id: \.id) { nowPlaying in
                        HorizontalPosterCardComponentView(title: nowPlaying.title, backdropImage: nowPlaying.backdropPath)
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
                        ForEach(popularMovie, id: \.id) { popular in
                            VerticalPosterCardComponentView(
                                posterImage: popular.posterPath, popularity: popular.voteAverage, titleMovie: popular.title, category: popular.title)
                        }
                    }
                    .padding(.horizontal,25)
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
    
                
            }
            
            
            
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
                            VerticalPosterCardComponentView(posterImage: topRated.posterPath, popularity: topRated.voteAverage, titleMovie: topRated.title, category: topRated.title)
                        }
                    }
                    .padding(.horizontal,25)
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                
            }
            
            
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
                            VerticalPosterCardComponentView(posterImage: upcoming.posterPath, popularity: upcoming.voteAverage, titleMovie: upcoming.title, category: upcoming.title)
                        }
                    }
                    .padding(.horizontal,25)
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                
                
            }
            
            
        }
        .scrollIndicators(.hidden)
        .scrollTargetLayout()
        .task {
            do {

                popularMovie = try await getPopularMovies()
                topRatedMovie = try await getTopRatedMovies()
                upcomingMovie = try await getUpcomingMovies()
                nowPlayingMovie = try await getNowPlayingMovie()
                
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
        
        
    }
    
    
}

#Preview {
    HomeView()
}
