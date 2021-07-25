//
//  Encodable+Data.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

import Foundation

extension Encodable {
    func toJSONData() -> Data? { try? JSONEncoder().encode(self) }
}
