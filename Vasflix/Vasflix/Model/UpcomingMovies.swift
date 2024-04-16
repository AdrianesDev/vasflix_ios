import Foundation

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
