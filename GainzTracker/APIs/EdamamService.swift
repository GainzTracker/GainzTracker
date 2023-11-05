//
//  EdamamService.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/4/23.
//

import UIKit

struct EdamamService {
    static let apiKey = "9a93e7ba03cf805171ab45844a08eab7"
    static let appId = "5278a75c"
    static let baseAPIURL = "https://api.edamam.com/search"

    func fetchRecipes(query: String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "app_id", value: EdamamService.appId),
            URLQueryItem(name: "app_key", value: EdamamService.apiKey)
        ]
        var urlComps = URLComponents(string: EdamamService.baseAPIURL)!
        urlComps.queryItems = queryItems

        guard let url = urlComps.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let searchResult = try decoder.decode(RecipeSearchResult.self, from: data)
                completion(.success(searchResult.hits.map { $0.recipe }))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    enum NetworkError: Error {
        case invalidURL
        case noData
    }
}
