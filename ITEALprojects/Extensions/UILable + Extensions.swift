//
//  UILable + Extensions.swift
//  ITEALprojects
//
//  Created by Витя Рябко on 01/03/23.
//

import UIKit

extension UILabel {
    convenience init(text: String, textColor: UIColor, font: UIFont){
        self.init()
        self.text = text
        self.tintColor = textColor
        self.font = font
        
        
    }
}
