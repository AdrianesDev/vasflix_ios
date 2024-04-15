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
    @State private var popularMovie: PopularMoviesModel?
    
    var body: some View {
        
        ScrollView {
            GeometryReader { proxy in
                Color.clear.preference(key: scrollPreKey.self, value: proxy.frame(in: .named("scroll")).minY)
                
            }
            ScrollView(.horizontal) {
                HStack(alignment: .center, spacing: 30){
                    ForEach(0..<5) {_ in
                        HorizontalPosterCardComponentView()
                    }
                }
            }
            .padding(.leading,30)
            
            Spacer()
                .frame(height: 30)
            //MARK: - popular movies
            VStack(alignment: .leading) {
                Text("Trending now")
                    .font(.system(size: 20,weight: .medium))
                    .foregroundStyle(.white)
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 15){
                        ForEach(0..<5, id: \.self) { result in
                            VerticalPosterCardComponentView()
                        }
                    }
                }
                
            }
            .padding(.leading,30)
            .task {
                do {
                    popularMovie = try await getPopularMovies()
                } catch ErrorCoding.invalidURL{
                    print("Invalid URL")
                } catch ErrorCoding.invalidResponse {
                    print("Invalid Response")
                } catch ErrorCoding.invalidData {
                    print("Invalid Data")
                } catch {
                    print("unexpeted Error")
                }
            }
            
            Spacer()
                .frame(height: 30)
            
            VStack(alignment: .leading) {
                Text("Top Rated")
                    .font(.system(size: 20,weight: .medium))
                    .foregroundStyle(.white)
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 15){
                        ForEach(0..<5) {_ in
                            VerticalPosterCardComponentView()
                        }
                    }
                }
                
            }
            .padding(.leading,30)
            
            Spacer()
                .frame(height: 30)
            
            VStack(alignment: .leading) {
                Text("Upcoming movies")
                    .font(.system(size: 20,weight: .medium))
                    .foregroundStyle(.white)
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 15){
                        ForEach(0..<5) {_ in
                            VerticalPosterCardComponentView()
                        }
                    }
                }
                
                
            }
            .padding(.leading,30)
            
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
