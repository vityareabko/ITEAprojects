//
//  ContactDetailController.swift
//  ITEALprojects
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

class ContactDetailController: UIViewController {

    var firstName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    var lastName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .red
        
        self.view.addSubview(firstName)
        self.view.addSubview(lastName)
        firstName.translatesAutoresizingMaskIntoConstraints = false
        lastName.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
}

extension ContactDetailController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            lastName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            lastName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            lastName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            firstName.topAnchor.constraint(equalTo: lastName.topAnchor, constant: 20),
            firstName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            firstName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
            
        ])
    }
}
