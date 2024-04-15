//
//  PopularMovies.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 11/04/24.
//

import Foundation

func getPopularMovies() async throws -> PopularMoviesModel {
    let endpoint = "https://api.themoviedb.org/3/movie/popular?api_key=\(API_KEY)"
    
    guard let url = URL(string: endpoint) else {
        throw ErrorCoding.invalidURL
    }
        
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        
        throw ErrorCoding.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(PopularMoviesModel.self, from: data)
    } catch {
        throw ErrorCoding.invalidData
    }
}

