//
//  Register.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 25/07/21.
//

import Foundation

struct Register: Codable {
    let phoneNumber: String?
    let idUser: Int?
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case idUser = "id_user"
    }
}
