//
//  RegisterUserResponseBody.swift
//  Versatile
//
//  Created by uhooi on 2021/08/02.
//

struct RegisterUserResponseBody: Decodable {
    let id: String
}

extension RegisterUserResponseBody {
    func convertToUserID() -> UserID { .init(id: self.id) }
}
