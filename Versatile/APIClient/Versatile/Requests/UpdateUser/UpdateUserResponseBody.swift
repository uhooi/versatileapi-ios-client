//
//  UpdateUserResponseBody.swift
//  Versatile
//
//  Created by uhooi on 2021/08/02.
//

struct UpdateUserResponseBody: Decodable {
    let id: String
}

extension UpdateUserResponseBody {
    func convertUserID() -> UserID { .init(id: self.id) }
}
