//
//  PulsaDetails.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 14/10/21.
//

import Foundation

struct PulsaDetails: Codable {
    let billDetails: [BillDetails]?
    let billerName: String?
    let inquiryId: String?
    let paymentType: String?
    let responseCode: String?
    let responseMessage: String?
    let subscriberId: String?
    let subscriberName: String?

    enum CodingKeys: String, CodingKey {
        case billDetails = "billdetails"
        case billerName = "billername"
        case inquiryId = "inquiryid"
        case paymentType = "paymenttype"
        case responseCode = "responsecode"
        case responseMessage = "responsemsg"
        case subscriberId = "subscriberid"
        case subscriberName = "subscribername"
    }
}

/*
 "response": {
       "additionaldata": [],
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
       "billername": "PULSA INDOSAT",
       "inquiryid": "37571612",
       "paymenttype": "CLOSE_PAYMENT",
       "responsecode": "0000",
       "responsemsg": "SUCCESS",
       "subscriberid": "085883515748",
       "subscribername": ""
     }
 */
