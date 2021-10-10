//
//  User.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 08/10/21.
//

import Foundation

struct User: Codable {
    let idUser: Int?
    let username: String?
    let password: String?
    let idRoleMaster: String?
    let idWorkflowStatus: String?
    let androidDeviceToken: Int?
    let iosDeviceToken: String?
    let isNewUser: String?
    let lastLogin: String?
    let createdAt: String?
    let createdBy: String?
    let updatedAt: String?
    let updatedBy: String?
    let deletedAt: String?
    let deletedBy: String?
    
    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case username
        case password
        case idRoleMaster = "id_role_master"
        case idWorkflowStatus = "id_workflow_status"
        case androidDeviceToken = "android_device_token"
        case iosDeviceToken = "ios_device_token"
        case isNewUser = "is_new_user"
        case lastLogin = "last_login"
        case createdAt = "created_at"
        case createdBy = "created_by"
        case updatedAt = "updated_at"
        case updatedBy = "updated_by"
        case deletedAt = "deleted_at"
        case deletedBy = "deleted_by"
    }
}

/*
 "id_user": 86770,
       "username": "2",
       "password": "$2y$10$3LYLBGHA8kHEuqh72JfHbOs4rR2rtuVa.iCPpUMmdBuI0vJMFNwMi",
       "id_role_master": "ROLE001",
       "id_workflow_status": "MBRSTS05",
       "android_device_token": null,
       "ios_device_token": null,
       "is_new_user": "0",
       "last_login": "2021-10-08 21:43:52.000",
       "created_at": "2020-04-28 11:09:58.417",
       "created_by": "1",
       "updated_at": "2021-10-08 21:43:52.207",
       "updated_by": null,
       "deleted_at": null,
       "deleted_by": null
 */

/*
 "data": [
     {
       "master_provider_phone_id": 11,
       "provider_phone_name": "Mentari",
       "provider_phone_number": "0858",
       "billers_id_pulsa": "9900007",
       "provider_phone_image": "http://1.bp.blogspot.com/-aayixrYWVHU/Vv3gPeQ8IMI/AAAAAAAAD3E/LObcRoujgJA-SgvHJhzXZig8EEvzVU5Yw/s1600/Indosat%2BOoredoo%2BVector%2BLogo.png",
       "provider_phone_code": "indosat",
       "billers_id_paketdata": "9900015",
       "status": "1"
     }
   ]
 
 cek saldo di microloan
 */
