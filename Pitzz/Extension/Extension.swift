//
//  Extension.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation

extension Encodable {
    func toJSONData() -> Data? { try? JSONEncoder().encode(self) }
}
