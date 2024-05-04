//
//  DiscoverMovies.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 04/05/24.
//

import Foundation



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
