//
//  Constants.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import Foundation

class Constants {
    //BASE URL
    static let baseUrl = "https://commerce-kai-user.azurewebsites.net"
    //AUTH
    //post
    static let auth = "/auth"
    static let authForgot = "/auth/forgot"
    static let reg = "/reg"
    static let otp = "/otp/validate"
    //get
    static let authCheck = "/auth/check"
    static let authRefresh = "/auth/refresh"
    static let authCredentials = "/auth/credentials"
    //TOKEN
    static let getTokenIndividu = "/user-token/token-get-individu"
    static let getTokenList = "/user-token/token-get-list"
    //PROFILE
    static let getProfile = "/profile/get"
    static let getCompany = "/company/get"
}
