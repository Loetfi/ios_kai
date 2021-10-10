//
//  Authentication.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 21/07/21.
//

import Foundation

struct Authentication: Codable {
    let token: String?
    let isNewUser: String?
    let idRoleMaster: String?
    
    enum CodingKeys: String, CodingKey {
        case token
        case isNewUser = "is_new_user"
        case idRoleMaster = "id_role_master"
    }
}
