//
//  PulsaList.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 14/10/21.
//

import Foundation

struct PulsaList: Codable {
    let systemMessage: String?
    let response: PulsaDetails?
    let trace: Trace?

    enum CodingKeys: String, CodingKey {
        case systemMessage = "system_message"
        case response
        case trace
    }
}
