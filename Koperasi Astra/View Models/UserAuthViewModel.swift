//
//  UserAuthViewModel.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import Foundation

class UserAuthViewModel {
    let apiHelper = ApiHelper()
    
    func postLogin(body: [String:Any],
                   onSuccess: @escaping (Authentication) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.postRequest(
            url: Constants.baseUrl+Constants.auth,
            body: body,
            onSuccess: { response in onSuccess(response) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
}
