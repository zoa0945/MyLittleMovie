//
//  Movie.swift
//  MyLittleMovie
//
//  Created by zoa0945 on 2022/10/02.
//

import Foundation

struct Movies: Codable {
    let page: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page, results
    }
}

struct Movie: Codable {
    let thumnailPath: String
    let overview: String
    let title: String
    let popularity: Double
    let id: Int
    let genreIds: [Int]
    
    enum CodingKeys: String, CodingKey {
        case overview, title, popularity, id
        case thumnailPath = "poster_path"
        case genreIds = "genre_ids"
    }
}
