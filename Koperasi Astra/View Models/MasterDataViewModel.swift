//
//  MasterDataViewModel.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 18/10/21.
//

import Foundation

class MasterDataViewModel {
    let apiHelper = ApiHelper()
    let userId: String =  UserDefaults.standard.string(forKey: "userID") ?? ""
    
    func getCompanyLists(body: [String:Any],
                   onSuccess: @escaping ([MasterCompany], String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.getRequest(
            url: Constants.baseUrl+Constants.getCompany,
            body: body,
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)") }
        )
    }
}
    
