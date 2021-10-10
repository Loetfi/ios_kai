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
    static let auth = "/auth"
    static let authForgot = "/auth/forgot"
    static let authCheck = "/auth/check"
    static let authRefresh = "/auth/refresh"
    static let authCredentials = "/auth/credentials"
    static let authBackend = "/auth_backend"
    static let reg = "/reg"
    static let otp = "/otp/validate"
    //TOKEN
    static let getTokenIndividu = "/user-token/token-get-individu"
    static let getTokenList = "/user-token/token-get-list"
    //PROFILE
    static let getProfile = "/profile/get"
    static let getProfileChangePassword = "/profile/change-password"
    static let getProfileAdress = "/profile/get-address-by-user"
    static let postProfileSearch = "/profile/search"
    static let getGenerateNik = "/profile/generate-nik"
    static let postProfileUpdate = "/profile/update"
    static let postPhotoUpload = "/profile/photo/upload"
    static let getProfileBank = "/profile/bank"
    static let postProfileBankUpdate = "/profile/bank/update"
    static let getProfileDocument = "/profile/document"
    static let postProfileDocumentDelete = "/profile/document/delete"
    static let postProfileDocumentAdd = "/profile/document/add"
    static let postProfileDocumentUpdate = "/profile/document/update"
    static let getProfileSalary = "/profile/salary"
    static let getProfileCompany = "/profile/company"
    static let postProfileCompanyUpdate = "/profile/company/update"
    static let getProfileFullfillment = "/profile/fullfillment"
    //USER
    static let getUserDetails = "/user/detail"
    //MASTER
    static let getMasterBank = "/mst/bank"
    static let getMasterDomicile = "/mst/domicile"
    static let getMasterGender = "/mst/gender"
    static let getMasterGrade = "/mst/grade"
    static let getMasterMarriage = "/mst/marriage"
    static let getMasterReligion = "/mst/religion"
    static let getMasterRole = "/mst/role"
    static let getMasterUserStatus = "/mst/user/status"

    static let getCompanyList = "/company/list"
    static let getCompany = "/company/get"
    static let getCompanyAuth = "/company/auth/get"
    static let postCompanyAdd = "/company/add"
    static let postCompanyEdit = "/company/edit"
    static let postCompanyDelete = "/company/delete"
}
