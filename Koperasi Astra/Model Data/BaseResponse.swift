//
//  BaseResponse.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 25/07/21.
//

import Foundation
import SwiftyJSON

class BaseResponse: NSObject {
    var data: JSON
    
    init(json: JSON) {
        data = json["data"]
    }
}

struct BaseResults: Codable {
    var data: String?
    
    private enum CodingKeys: String, CodingKey {
        case data
    }
}

