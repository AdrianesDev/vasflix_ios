//
//  NowPlayingMovie.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 16/04/24.
//

import Foundation

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
