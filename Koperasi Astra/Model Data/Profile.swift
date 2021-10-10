//
//  Profile.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 08/10/21.
//

import Foundation

struct Profile: Codable {
    let idUserProfile : Int?
    let idUser : String?
    let idKoperasi : String?
    let name : String?
    let personalIdentityPath : String?
    let personalPhoto : String?
    let phoneNumber : String?
    let email : String?
    let npwp : String?
    let motherName : String?
    let domicileAddress : String?
    let idDomicileAddressStatus : String?
    let idHeirsRelationStatus : String?
    let idMarriageStatus : String?
    let loanPlafond : String?
    let microloanPlafond : String?
    let idGender : String?
    let idReligion : String?
    let birthPlace : String?
    let birthDate : String?
    let marriageIdentityPhoto : String?
    let npwpNo : String?
    let npwpPhoto : String?
    let identityId : String?
    let dateBecomeMember : String?
    let idBank : String?
    let accountNumberBank : String?
    let accountNameBank : String?
    let accountBranchBank : String?
    
    enum CodingKeys: String, CodingKey {
        case idUserProfile = "id_user_profile"
        case idUser = "id_user"
        case idKoperasi = "id_koperasi"
        case name = "name"
        case personalIdentityPath = "personal_identity_path"
        case personalPhoto = "personal_photo"
        case phoneNumber = "phone_number"
        case email = "email"
        case npwp = "npwp"
        case motherName = "mother_name"
        case domicileAddress = "domicile_address"
        case idDomicileAddressStatus = "id_domicile_address_status"
        case idHeirsRelationStatus = "id_heirs_relation_status"
        case idMarriageStatus = "id_marriage_status"
        case loanPlafond = "loan_plafond"
        case microloanPlafond = "microloan_plafond"
        case idGender = "id_gender"
        case idReligion = "id_religion"
        case birthPlace = "birth_place"
        case birthDate = "birth_date"
        case marriageIdentityPhoto = "marriage_identify_photo"
        case npwpNo = "NPWP_No"
        case npwpPhoto = "NPWP_Photo"
        case identityId = "identity_id"
        case dateBecomeMember = "date_become_member"
        case idBank = "id_bank"
        case accountNumberBank = "account_number_bank"
        case accountNameBank = "account_name_bank"
        case accountBranchBank = "account_branch_bank"
    }
}

/*
 "id_user_profile": 86764,
 "id_user": "86770",
 "id_koperasi": "2",
 "name": "Testing nol dua edit",
 "personal_identity_path": "",
 "personal_photo": "https://commercestrorage.blob.core.windows.net/users/86770/img/7cc079d311570528e298130a25ad6e93c70324ef.png",
 "phone_number": "0859212020189",
 "email": "lutfi.f.h.idayat@gmail.com",
 "npwp": null,
 "mother_name": "test",
 "domicile_address": null,
 "id_domicile_address_status": "DMC003",
 "id_heirs_relation_status": null,
 "id_marriage_status": "MRG001",
 "loan_plafond": null,
 "microloan_plafond": "500000",
 "id_gender": "1",
 "id_religion": "RELG01",
 "birth_place": "jakarta",
 "birth_date": "2006-09-01 00:00:00.000",
 "marriage_identify_photo": null,
 "NPWP_No": "13223",
 "NPWP_Photo": null,
 "identity_id": "111",
 "date_become_member": "2021-07-23 22:58:19.000",
 "id_bank": "14",
 "account_number_bank": "037885544",
 "account_name_bank": "Iron Man",
 "account_branch_bank": "Jakarta"
 */
