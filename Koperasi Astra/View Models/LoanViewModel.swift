//
//  LoanViewModel.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 17/10/21.
//

import Foundation

class LoanViewModel {
    let apiHelper = ApiHelper()
    let userId: String =  UserDefaults.standard.string(forKey: "userID") ?? ""
    
    func getMicroloanBalance(
                    onSuccess: @escaping (MicroloanBalance, String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.getRequestBearer(
            url: Constants.loanUrl+Constants.microloanBalance,
            body: ["":""],
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)")}
        )
    }
    
    func getVoucherValidate(type: String, code: String,
                    onSuccess: @escaping (String, String) -> Void,
                   onError: @escaping (String) -> Void,
                   onFailed: @escaping (String) -> Void) {
        apiHelper.getRequestBearer(
            url: Constants.loanUrl+Constants.voucherValidate+"?loan_type=\(type)&code=\(code)",
            body: ["":""],
            onSuccess: { response,message in onSuccess(response,message) },
            onError: { error in onError("\(error)") },
            onFailed: { failed in onFailed("\(failed)")}
        )
    }
}
