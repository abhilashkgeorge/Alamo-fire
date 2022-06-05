//
//  URL+Extention.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 03/06/22.
//

import Foundation

extension URL {
    
    static func fetchURLForContactData() -> URL {
        guard let url = URL(string: "https://cwindia-api.creatorofone.in/bp/api/contact/GetContactPortal") else {
            fatalError("Error getting URL")
        }
        return url
    }
}
