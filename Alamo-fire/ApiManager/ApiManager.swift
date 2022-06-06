//
//  ApiManager.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 23/05/22.
//

import Foundation
import Alamofire

class ApiManager {
    
    func getcontactDetais(completionHandler: @escaping (_ json: [String: Any]) -> Void) {
        let url = URL.fetchURLForContactData()
        AF.request(url).response { response in
            guard let response = response.data else {
                return
            }
            let jsonResponse = try? JSONSerialization.jsonObject(with: response, options: [])
            if let jsonResponse = jsonResponse as? [String: Any], let info = jsonResponse["data"] as? [String: Any]
            {
                completionHandler(info)
            }
            
            else {
                print("Error getting Data from API!")
            }
            
        }
    }
}
