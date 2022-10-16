//
//  TMDBMovieAPI.swift
//  MyLittleMovie
//
//  Created by zoa0945 on 2022/10/02.
//

import Foundation

class TMDBMovieAPI {
    private let apiKey = "f0b92211e90937fabed2d281adfde8f1"
    
    func searchMovie(_ movieName: String) {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(movieName)") else {
            print("url error")
            return
        }
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard error == nil,
                let data = data else {
                print("error")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Movies.self, from: data)
                print(result.results)
            } catch let error {
                print("Parsing Error: \(error.localizedDescription)")
                return
            }
        }
        dataTask.resume()
    }
}
