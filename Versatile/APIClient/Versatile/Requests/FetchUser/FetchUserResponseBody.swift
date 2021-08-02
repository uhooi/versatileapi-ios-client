//
//  FetchUserResponseBody.swift
//  Versatile
//
//  Created by uhooi on 2021/08/02.
//

struct FetchUserResponseBody: Decodable {
    let id: String
    let name: String
    let description: String
}

extension FetchUserResponseBody {
    func convertUser() -> User { .init(id: self.id, name: self.name, description: self.description) }
}
