//
//  UIFont + Extenstion.swift
//  ITEALprojects
//
//  Created by Витя Рябко on 01/03/23.
//

import UIKit

extension UIFont {
    
    // Regular
    
    static func robotoRegular18() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: 18) ?? UIFont.systemFont(ofSize: 50)
    }
    
    // Medium
    
    static func robotoMedium18() -> UIFont? {
        return UIFont(name: "Roboto-Medium", size: 18) ?? UIFont.systemFont(ofSize: 50)
    }
    
    // Bold
    
    static func robotoBold18() -> UIFont? {
        return UIFont(name: "Roboto-Bold", size: 18) ?? UIFont.systemFont(ofSize: 50)
    }
    
    
    
}
