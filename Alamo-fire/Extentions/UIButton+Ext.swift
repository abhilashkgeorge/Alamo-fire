//
//  UIButton+Ext.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 26/05/22.
//

import UIKit

class LoginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        self.titleLabel?.font = UIFont(name: "SF-Pro-Text-Bold.otf", size: 22)
    }
    

}
