//
//  FetchAllUserResponseBody.swift
//  Versatile
//
//  Created by uhooi on 2021/08/02.
//

struct FetchAllUserResponseBody: Decodable {
    let id: String
    let name: String
    let description: String
}

extension FetchAllUserResponseBody {
    func convertToUser() -> User { .init(id: self.id, name: self.name, description: self.description) }
}
