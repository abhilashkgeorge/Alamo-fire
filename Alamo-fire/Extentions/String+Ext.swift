//
//  String+Ext.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 06/06/22.
//

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
