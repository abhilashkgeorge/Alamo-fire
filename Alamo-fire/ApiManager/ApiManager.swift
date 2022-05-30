//
//  ApiManager.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 23/05/22.
//

import Foundation
import Alamofire

class ApiManager {
    
    func getRequestWithAlamoFire() {
        AF.request("https:httpbin.org/get").response {
            response in
            print("hello")
            debugPrint(response)
        }
    }
    
    func postRequestWithAlamoFire() {
        
    }
}
