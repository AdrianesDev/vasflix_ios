//
//  ErrorFile.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 11/04/24.
//

import Foundation

enum ErrorCoding: Error {
    case invalidURL
    case invalidResponse
    case invalidData(Error)
}
