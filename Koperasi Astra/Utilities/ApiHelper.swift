//
//  ApiHelper.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import Alamofire
import SwiftyJSON
import UIKit
import FirebaseMessaging

class ApiHelper: NSObject {
    let userToken: String =  UserDefaults.standard.string(forKey: "userToken") ?? ""
    let deviceToken: String =  UserDefaults.standard.string(forKey: "deviceToken") ?? ""
    let userId: String =  UserDefaults.standard.string(forKey: "userID") ?? ""
    var window: UIWindow?
    
    private func defineMethod(method: String) -> HTTPMethod {
        switch method {
        case "GET":
            return .get
        case "POST":
            return .post
        case "PUT":
            return .put
        default:
            return .get
        }
    }
    
    public func getRequest<T: Codable>(url: String, body: Parameters, onSuccess: @escaping (T) -> Void, onError: @escaping (String) -> Void, onFailed: @escaping (String) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/application/json"
        ]
        
        AF.request(url, method: .get, parameters: body, encoding: JSONEncoding.default, headers: headers).response { response in
            switch response.result {
            case .failure(let error):
                onFailed(error.localizedDescription)
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: value!)
                    onSuccess(result)
                } catch let error {
                    debugPrint(error)
                    onError("unexpected error: \(error)")
                }
            }
        }
    }
    
    public func postRequest<T: Codable>(url: String, body: Parameters, onSuccess: @escaping (T) -> Void, onError: @escaping (String) -> Void, onFailed: @escaping (String) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/application/json"
        ]
        
        AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).response { response in
            switch response.result {
            case .failure(let error):
                onFailed(error.localizedDescription)
            case .success(let value):
                let json = JSON(value!)
                do {
                    let decoder = JSONDecoder()
                    let status = json["status"].intValue
                    let message = json["message"]
                    if status == 1 {
                        let result = try decoder.decode(T.self, from: value!)
                        onSuccess(result)
                    } else {
                        onFailed(message.stringValue)
                    }
                } catch let error {
                    debugPrint(error)
                    onError("\(error)")
                }
            }
        }
    }
}
