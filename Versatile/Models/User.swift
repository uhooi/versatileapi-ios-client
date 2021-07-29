//
//  User.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

struct User: Decodable, Identifiable {
    let id: String
    let name: String
    let description: String
}
