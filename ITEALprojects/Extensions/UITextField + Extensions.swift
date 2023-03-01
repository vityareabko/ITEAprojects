//
//  UITextField + Extensions.swift
//  ITEALprojects
//
//  Created by Витя Рябко on 01/03/23.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String, keyBoardType: UIKeyboardType, autocapitalizationType: UITextAutocapitalizationType, isSecureTextEntry: Bool ){
        self.init()
        
        self.keyboardType = keyboardType // TODO: - <#Message#>
        self.attributedText = attributedText // TODO: - <#Message#>
        self.isSecureTextEntry = isSecureTextEntry
        
        self.textColor = .label
        self.textAlignment = .left
        self.font = .robotoRegular18()
        self.layer.cornerRadius = 5
        self.backgroundColor = .secondarySystemBackground
        
        self.leftViewMode = .always
        self.rightViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 0))
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 0))
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel])
        
        self.autocorrectionType = .default
    }
}
