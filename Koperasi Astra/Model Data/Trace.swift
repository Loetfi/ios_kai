//
//  Trace.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 14/10/21.
//

import Foundation

struct Trace: Codable {
    let sessionId: String?
    let requestDataTime: String?
    let words: String?
    let billerId: String?
    let accountNumber: String?
    let systrace: Int?
    let inquiryId: String?

    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case requestDataTime = "request_date_time"
        case words
        case billerId = "biller_id"
        case accountNumber = "account_number"
        case systrace
        case inquiryId = "inquiry_id"
    }
}

/*
 "trace": {
       "session_id": "81215AEFADFB710C1258F79ABA1AD710.node3",
       "request_date_time": "20190704185319",
       "words": "c53de863714d0a2d2612038a19b16e814fa53c1d",
       "biller_id": "9900007",
       "account_number": "085883515748",
       "systrace": 1634180851,
       "inquiry_id": "37571612"
     }
 */
