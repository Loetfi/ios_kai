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
    static let billerUrl = "http://13.67.41.162"
    static let loanUrl = "https://commerce-kai-loan.azurewebsites.net"
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
    //Biller
    static let checkPhoneOperator = "/order/check-phone"
    static let orderPaymentToBiller = "/order​/payment-to-biller"
    static let customerList = "/order​/customer​/list"
    static let orderBiller = "/order/biller"
    
    static let dokuVaNotify = "/doku/va/notify"
    static let dokuVaInqiury = "/doku/va/inquiry"
    static let dokuVaRequest = "/doku/va/request"
    
    static let billerPayment = "/biller/payment"
    static let billerBalance = "/biller/balance"
    static let billerList = "/biller/list"
    static let billerUpdate = "/biller/update"
    static let billerInquiry = "/biller/inquiry"
    static let billerElectricityPostpaid = "/biller/inquiry-electricity-postpaid"
    static let billerElectricityPrepaid = "/biller/inquiry-electricity-prepaid"
    static let pulsaData = "/biller/inquiry-pulsa-data"
    
    static let userRegistration = "/payment/list/user-registration"
    //Loan
    static let microloanBalance = "/microloan/balance"
    static let voucherValidate = "/loan/voucher/validate"
    //Company
    static let getCompanyList = "/company/list"
    static let getCompany = "/company/get"
    static let getCompanyAuth = "/company/auth/get"
    static let postCompanyAdd = "/company/add"
    static let postCompanyEdit = "/company/edit"
    static let postCompanyDelete = "/company/delete"
}
