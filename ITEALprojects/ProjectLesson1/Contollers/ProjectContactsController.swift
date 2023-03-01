//
//  ProjectContactsController.swift
//  ITEALprojects
//
//  Created by Витя Рябко on 01/03/23.
//

import UIKit

class ProjectContactsController: UIViewController {
    
    // MARK: - Vairiables
    
    private let stackViewButtons = UIStackView()
    private let stackViewTextFieldsForm = UIStackView()
    private var contacts: [Contact?] = []
    
    // MARK: - UI Components
    
    private lazy var addContactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemGray
        button.backgroundColor = #colorLiteral(red: 0.8535049558, green: 0.8914468884, blue: 0.9202767015, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 42)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTappedAddCell), for: .touchUpInside)
        return button
    }()
    
    private lazy var delContactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8535049558, green: 0.8914468884, blue: 0.9202767015, alpha: 1)
        button.tintColor = .systemBlue
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 42)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTappedDeleteCell), for: .touchUpInside)
        return button
    }()
    
    private let tableViewContacts : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20);
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return tableView
    }()
    
    private let contactFirstNameTF = UITextField(placeholder: "First Name", keyBoardType: .default, autocapitalizationType: .sentences, isSecureTextEntry: false)
    private let contactLastNameTF = UITextField(placeholder: "Last Name", keyBoardType: .default, autocapitalizationType: .sentences, isSecureTextEntry: false)
    private let contactEmailTF = UITextField(placeholder: "E-mail", keyBoardType: .emailAddress, autocapitalizationType: .sentences, isSecureTextEntry: false)
    private let contactPasswordTF = UITextField(placeholder: "Password", keyBoardType: .default, autocapitalizationType: .sentences, isSecureTextEntry: true)
    
    // MARK: - Lifecycle
   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewContacts.dataSource = self
        tableViewContacts.delegate = self
        
        if contacts.isEmpty{
            delContactButton.isEnabled = false
        }
        
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(false)
    }
        
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        stackViewButtons.addArrangedSubview(addContactButton)
        stackViewButtons.addArrangedSubview(delContactButton)
        stackViewButtons.axis = .horizontal
        stackViewButtons.distribution = .fillEqually
        stackViewButtons.spacing = 30
        
        stackViewTextFieldsForm.addArrangedSubview(contactFirstNameTF)
        stackViewTextFieldsForm.addArrangedSubview(contactLastNameTF)
        stackViewTextFieldsForm.addArrangedSubview(contactEmailTF)
        stackViewTextFieldsForm.addArrangedSubview(contactPasswordTF)
        stackViewTextFieldsForm.axis = .vertical
        stackViewTextFieldsForm.distribution = .fillEqually
        stackViewTextFieldsForm.spacing = 10
        
        self.view.addSubview(stackViewButtons)
        self.view.addSubview(stackViewTextFieldsForm)
        self.view.addSubview(tableViewContacts)
        stackViewButtons.translatesAutoresizingMaskIntoConstraints = false
        stackViewTextFieldsForm.translatesAutoresizingMaskIntoConstraints = false
        tableViewContacts.translatesAutoresizingMaskIntoConstraints = false
//
        setConstraints()
    }
    
    // MARK: - Selectors
    
    @objc private func didTappedAddCell(){
        

        
        guard !contactFirstNameTF.text!.isEmpty, !contactLastNameTF.text!.isEmpty, !contactEmailTF.text!.isEmpty, !contactPasswordTF.text!.isEmpty else {
            
            
            
            if contactFirstNameTF.text!.isEmpty {
                contactFirstNameTF.layer.borderWidth = 1
                contactFirstNameTF.layer.borderColor = UIColor.red.cgColor
            }else {
                contactFirstNameTF.layer.borderWidth = 0
            }
            if contactLastNameTF.text!.isEmpty {
                contactLastNameTF.layer.borderWidth = 1
                contactLastNameTF.layer.borderColor = UIColor.red.cgColor
            }else {
                contactLastNameTF.layer.borderWidth = 0
            }
            if contactEmailTF.text!.isEmpty {
                contactEmailTF.layer.borderWidth = 1
                contactEmailTF.layer.borderColor = UIColor.red.cgColor
            }else {
                contactEmailTF.layer.borderWidth = 0
            }
            if contactPasswordTF.text!.isEmpty {
                contactPasswordTF.layer.borderWidth = 1
                contactPasswordTF.layer.borderColor = UIColor.red.cgColor
            }else {
                contactPasswordTF.layer.borderWidth = 0
            }

            return
            
        }
        
        contactPasswordTF.layer.borderWidth = 0
        contactEmailTF.layer.borderWidth = 0
        contactLastNameTF.layer.borderWidth = 0
        contactFirstNameTF.layer.borderWidth = 0
        
        let contact = Contact(fistName: contactFirstNameTF.text!,
                middleName: nil, lastName: contactLastNameTF.text!,
                email: contactEmailTF.text!,
                password: contactPasswordTF.text!)
        
        contacts.append(contact)
        contactFirstNameTF.text = ""
        contactLastNameTF.text = ""
        contactEmailTF.text = ""
        contactPasswordTF.text = ""
        
        delContactButton.isEnabled = true
        tableViewContacts.reloadData()
    }
    
    @objc private func didTappedDeleteCell(){
        if !contacts.isEmpty{
            contacts.removeLast()
            tableViewContacts.reloadData()
            if contacts.isEmpty { delContactButton.isEnabled = false }
        }
    }
   
}

// MARK: - Extensions

extension ProjectContactsController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contactFirstNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            stackViewButtons.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackViewButtons.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackViewButtons.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.65),
            stackViewButtons.heightAnchor.constraint(equalToConstant: 40),
            
            stackViewTextFieldsForm.topAnchor.constraint(equalTo: stackViewButtons.bottomAnchor, constant: 20),
            stackViewTextFieldsForm.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackViewTextFieldsForm.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            
            tableViewContacts.topAnchor.constraint(equalTo: stackViewTextFieldsForm.bottomAnchor, constant: 20),
            tableViewContacts.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tableViewContacts.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            tableViewContacts.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension ProjectContactsController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(contacts[indexPath.row]!.fistName) \(contacts[indexPath.row]!.lastName)"
        
        
        
        return cell
    }
    
    
}

extension ProjectContactsController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("DEBUG PRINT: didTap cell", indexPath)
    }
}
