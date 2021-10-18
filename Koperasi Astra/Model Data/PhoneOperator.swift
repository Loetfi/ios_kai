//
//  PhoneOperator.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 11/10/21.
//

import Foundation

struct PhoneOperator: Codable {
    let masterProviderPhoneId: Int?
    let providerPhoneName: String?
    let providerPhoneNumber: String?
    let billersIdPulsa: String?
    let providerPhoneImage: String?
    let providerPhoneCode: String?
    let billersIdPaketdata: String?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case masterProviderPhoneId = "master_provider_phone_id"
        case providerPhoneName = "provider_phone_name"
        case providerPhoneNumber = "provider_phone_number"
        case billersIdPulsa = "billers_id_pulsa"
        case providerPhoneImage = "provider_phone_image"
        case providerPhoneCode = "provider_phone_code"
        case billersIdPaketdata = "billers_id_paketdata"
        case status
    }
}

/*
 {
       "master_provider_phone_id": 11,
       "provider_phone_name": "Mentari",
       "provider_phone_number": "0858",
       "billers_id_pulsa": "9900007",
       "provider_phone_image": "http://1.bp.blogspot.com/-aayixrYWVHU/Vv3gPeQ8IMI/AAAAAAAAD3E/LObcRoujgJA-SgvHJhzXZig8EEvzVU5Yw/s1600/Indosat%2BOoredoo%2BVector%2BLogo.png",
       "provider_phone_code": "indosat",
       "billers_id_paketdata": "9900015",
       "status": "1"
     }
 */
