//
//  MicroloanBalance.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 17/10/21.
//


import Foundation

struct MicroloanBalance: Codable {
    let plafond: Int?
    let unpaid: Int?
    let balance: Int?

    enum CodingKeys: String, CodingKey {
        case plafond
        case unpaid
        case balance
    }
}
