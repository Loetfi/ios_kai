//
//  AuthCheck.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 08/10/21.
//

import Foundation

struct AuthCheck: Codable {
    let idUser: Int?
    let idRoleMaster: String?
    let username: String?
    let isNewUser: String?
    
    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case idRoleMaster = "id_role_master"
        case username
        case isNewUser = "is_new_user"
    }
}
