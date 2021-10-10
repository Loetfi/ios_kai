//
//  Company.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 08/10/21.
//

import Foundation

struct Company: Codable {
    let idUserCompany : Int?
    let idUserProfile : String?
    let idEmployee : String?
    let idGrade : String?
    let idCompany : String?
    let employeeStartingDate : String?
    let companyIdentityPath : String?
    let terminationDate : String?
    let idWorkflowStatus : String?
    let createdBy : Int?
    let createdAt : String?
    let updatedBy : String?
    let updatedAt : String?
    let deletedBy : String?
    let deletedAt : String?
    let position : String?
    let division : String?
    
    enum CodingKeys: String, CodingKey {
        case idUserCompany = "id_user_company"
        case idUserProfile = "id_user_profile"
        case idEmployee = "id_employee"
        case idGrade = "id_grade"
        case idCompany = "id_company"
        case employeeStartingDate = "employee_starting_date"
        case companyIdentityPath = "company_identity_path"
        case terminationDate = "termination_date"
        case idWorkflowStatus = "id_workflow_status"
        case createdBy = "created_by"
        case createdAt = "created_at"
        case updatedBy = "updated_by"
        case updatedAt = "updated_at"
        case deletedBy = "deleted_by"
        case deletedAt = "deleted_at"
        case position = "position"
        case division = "division"
    }
}

/*
 "id_user_company": 83313,
       "id_user_profile": "86764",
       "id_employee": "022020",
       "id_grade": "GRD004",
       "id_company": "COMP361",
       "employee_starting_date": "2019-09-10",
       "company_identity_path": "",
       "termination_date": null,
       "id_workflow_status": "EMPSTS01",
       "created_by": null,
       "created_at": null,
       "updated_by": "86770",
       "updated_at": "2021-09-28 17:43:06.000",
       "deleted_by": null,
       "deleted_at": null,
       "position": "Okkj",
       "division": "Ok"
 */
