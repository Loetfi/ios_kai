//
//  OrderBiller.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 21/10/21.
//

import Foundation

struct OrderBiller: Codable {
    let messageSystem: String?
    let vaNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case messageSystem = "message_system"
        case vaNumber = "va_number"
    }
}
