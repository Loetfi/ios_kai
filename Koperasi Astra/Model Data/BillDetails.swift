//
//  BillDetails.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 14/10/21.
//

import Foundation

struct BillDetails: Codable {
    let adminFee: String?
    let billId: String?
    let currency: String?
    let title: String?
    let totalAmount: String?
    let descriptions: String?
    let body: [String]

    enum CodingKeys: String, CodingKey {
        case adminFee = "adminfee"
        case billId = "billid"
        case currency
        case title
        case totalAmount = "totalamount"
        case descriptions
        case body
    }
}

/*
 "billdetails": [
   {
     "adminfee": "0.0",
     "billid": "7",
     "currency": "360",
     "title": "INDOSAT 50rb - 49.850",
     "totalamount": "49850.00",
     "descriptions": null,
     "body": [
       "DENOM           : 50000"
     ]
   }
 ],
 */
