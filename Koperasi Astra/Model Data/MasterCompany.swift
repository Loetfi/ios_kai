//
//  MasterCompany.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 18/10/21.
//

import Foundation

struct MasterCompany: Codable {
    let idCompany: String?
    let nameCompany: String?
    
    enum CodingKeys: String, CodingKey {
        case idCompany = "id_company"
        case nameCompany = "name_company"
    }
}
