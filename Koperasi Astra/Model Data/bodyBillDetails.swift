//
//  bodyBillDetails.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 14/10/21.
//

import Foundation

struct bodyBillDetails: Codable {
    let denom: String?

    enum CodingKeys: String, CodingKey {
        case denom = "DENOM"
    }
}
