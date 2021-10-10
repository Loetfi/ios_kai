//
//  BaseResponse.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 08/10/21.
//

import Foundation
import SwiftyJSON

class BaseResponse: NSObject {
    var data: JSON
    
    init(json: JSON) {
        data = json["data"]
    }
}
