//
//  MovieGenderList.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 18/04/24.
//

import Foundation

func getMovieGenderList() async throws -> [Genre] {
    let endpoint: String = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(API_KEY)"
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
