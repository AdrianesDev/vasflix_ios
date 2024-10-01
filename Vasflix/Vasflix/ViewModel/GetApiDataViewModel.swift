//
//  GetApiDataViewModel.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 30/09/24.
//

import Foundation


class GetApiDataViewModel: ObservableObject {
    
    func getPopularMovies() async throws -> [Result] {
        let endpoint = "https://api.themoviedb.org/3/movie/popular?api_key=\(API_KEY)"
        
        
        do {
            guard let url = URL(string: endpoint) else {
                throw ErrorCoding.invalidURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw ErrorCoding.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(PopularMoviesModel.self, from: data)
            return decoded.results
        } catch {
            
            throw ErrorCoding.invalidData(error)
        }
    }
    
    func getTopRatedMovies() async throws -> [TopRated] {
        let endpoint = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(API_KEY)"
        
        do {
            guard let url = URL(string: endpoint) else {
                throw ErrorCoding.invalidURL
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw ErrorCoding.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(TopRatedMoviesModel.self, from: data)
            return decoded.results
        }catch {
            throw ErrorCoding.invalidData(error)
        }
    }
    
    func getDiscoverMovies() async throws -> [Discover] {
        let endpoint: String = "https://api.themoviedb.org/3/discover/movie?api_key=\(API_KEY)"
        do {
            guard let url = URL(string: endpoint) else {
                throw ErrorCoding.invalidURL
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw ErrorCoding.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(DiscoverMoviesModel.self, from: data)
            return decoded.results
        }catch {
            throw ErrorCoding.invalidData(error)
        }
    }
    
    func getNowPlayingMovie() async throws -> [NowPlayingMovie] {
        let endpoint: String = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(API_KEY)"
        do {
            guard let url = URL(string: endpoint) else {
                throw ErrorCoding.invalidURL
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw ErrorCoding.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(NowPlayingModel.self, from: data)
            return decoded.results
        }catch {
            throw ErrorCoding.invalidData(error)
        }
    }
    
    func getUpcomingMovies() async throws -> [UpcomingMovies] {
        let endpoint: String = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(API_KEY)"
        do {
            guard let url = URL(string: endpoint) else {
                throw ErrorCoding.invalidURL
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw ErrorCoding.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(UpcomingMoviesModel.self, from: data)
            return decoded.results
        }catch {
            throw ErrorCoding.invalidData(error)
        }
    }
    
    func getMovieGenderList() async throws -> [Genre] {
        let endpoint: String = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(API_KEY)"
        do {
            guard let url = URL(string: endpoint) else {
                throw ErrorCoding.invalidURL
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw ErrorCoding.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(MovieGenderListModel.self, from: data)
            return decoded.genres
        }catch {
            throw ErrorCoding.invalidData(error)
        }
        
    }
    
    
    
    
}
