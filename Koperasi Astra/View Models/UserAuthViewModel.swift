//
//  UserAuthViewModel.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import Foundation

class UserAuthViewModel {
    let apiHelper = ApiHelper()
    let userId: String =  UserDefaults.standard.string(forKey: "userID") ?? ""
    
    func postLogin(body: [String:Any],
                   onSuccess: @escaping (Authentication, String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.postRequest(
            url: Constants.baseUrl+Constants.auth,
            body: body,
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
    
    func postRegister(body: [String:Any],
                   onSuccess: @escaping (Register, String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.postRequest(
            url: Constants.baseUrl+Constants.reg,
            body: body,
            onSuccess: { response,message  in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
    
    func postForgotPassword(body: [String:Any],
                            onSuccess: @escaping (Register, String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.postRequest(
            url: Constants.baseUrl+Constants.authForgot,
            body: body,
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
    
    func getAuthCheck(body: [String:Any],
                            onSuccess: @escaping (AuthCheck,String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.getRequestBearer(
            url: Constants.baseUrl+Constants.authCheck,
            body: body,
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
    
    func getUserDetails(body: [String:Any],
                            onSuccess: @escaping (UserDetail,String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.getRequestBearer(
            url: Constants.baseUrl+Constants.getUserDetails+"?id=\(userId)",
            body: body,
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
}
