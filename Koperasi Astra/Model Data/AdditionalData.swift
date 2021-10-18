//
//  AdditionalData.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 14/10/21.
//

import Foundation

struct AdditionalData: Codable {
    let id: String?

    enum CodingKeys: String, CodingKey {
        case id
    }
}
