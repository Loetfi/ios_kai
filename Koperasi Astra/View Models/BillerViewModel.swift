//
//  BillerViewModel.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 11/10/21.
//

import Foundation
import Alamofire

class BillerViewModel {
    let apiHelper = ApiHelper()
    let userId: String =  UserDefaults.standard.string(forKey: "userID") ?? ""
    
    func getCheckPhone(phoneCode: String,
                   onSuccess: @escaping ([PhoneOperator], String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.getRequest(
            url: Constants.billerUrl+Constants.checkPhoneOperator+"?phone_number=\(phoneCode)",
            body: ["":""],
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)")}
        )
    }
    
    func postPulsaList(billerId: String,accountNumber: String,
                   onSuccess: @escaping (PulsaList, String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.postRequest(
            url: Constants.billerUrl+Constants.pulsaData,
            body: ["billerid":billerId,
                   "accountnumber":accountNumber],
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)")}
        )
    }
    
    func postOrderBiller(body: Parameters,
                   onSuccess: @escaping (OrderBiller, String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.postRequestBearer(
            url: Constants.billerUrl+Constants.orderBiller,
            body: body,
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)")}
        )
    }
}
