//
//  UserDetail.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 08/10/21.
//

import Foundation

struct UserDetail: Codable {
    let user: User?
    let profile: Profile?
    let company: Company?
    
    enum CodingKeys: String, CodingKey {
        case user
        case profile
        case company
    }
}
