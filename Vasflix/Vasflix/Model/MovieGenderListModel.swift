//
//  MovieGenderListModel.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 18/04/24.
//

import Foundation

// MARK: - MovieGenderListModel
struct MovieGenderListModel: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
