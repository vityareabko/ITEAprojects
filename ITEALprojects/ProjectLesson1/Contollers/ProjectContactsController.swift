//
//  ProjectContactsController.swift
//  ITEALprojects
//
//  Created by Витя Рябко on 01/03/23.
//

import UIKit

class ProjectContactsController: UIViewController {
    
    // MARK: - Vairiables
    
    private var stackViewButtons = UIStackView()
    private var stackViewTextFieldsForm = UIStackView()
    private var contacts: [Contact?] = []
    private var contactsDict: [String : Contact] = [:]
    
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
    
    private let contactFirstNameTF = UITextField(placeholder: "First Name",
                                                 keyBoardType: .default,
                                                 autocapitalizationType: .sentences,
                                                 isSecureTextEntry: false)
    private let contactLastNameTF = UITextField(placeholder: "Last Name",
                                                keyBoardType: .default,
                                                autocapitalizationType: .sentences,
                                                isSecureTextEntry: false)
    private let contactEmailTF = UITextField(placeholder: "E-mail",
                                             keyBoardType: .emailAddress,
                                             autocapitalizationType: .sentences,
                                             isSecureTextEntry: false)
    private let contactPasswordTF = UITextField(placeholder: "Password",
                                                keyBoardType: .default,
                                                autocapitalizationType: .sentences,
                                                isSecureTextEntry: true)
    
    private lazy var addTask: UIButton = {
        let button = UIButton()
        button.setTitle("Practice", for: .normal)
        button.backgroundColor = .none
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.addTarget(self, action: #selector(didtapHomeWorkButton), for: .touchUpInside)
        return button
    }()
    
    private var arrayTextFields: [UITextField] = []

    
    // MARK: - Lifecycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let menuCustomBarButton = UIBarButtonItem(customView: addTask)
        navigationItem.rightBarButtonItem = menuCustomBarButton
        self.navigationController!.navigationBar.tintColor = .systemBlue

        

        tableViewContacts.dataSource = self
        tableViewContacts.delegate = self
        
        arrayTextFields.append(contactFirstNameTF)
        arrayTextFields.append(contactLastNameTF)
        arrayTextFields.append(contactEmailTF)
        arrayTextFields.append(contactPasswordTF)
        
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
        
        stackViewButtons = UIStackView(arrangedSubviews: [addContactButton, delContactButton],
                                       axis: .horizontal,
                                       spacing: 30)
        
        stackViewTextFieldsForm = UIStackView(arrangedSubviews: [contactFirstNameTF,
                                                                 contactLastNameTF,
                                                                 contactEmailTF,
                                                                 contactPasswordTF],
                                              axis: .vertical,
                                              spacing: 10)
        
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
            for textField in arrayTextFields {
                if textField.text!.isEmpty {
                    textField.layer.borderWidth = 1
                    textField.layer.borderColor = UIColor.red.cgColor
                }else {
                    textField.layer.borderWidth = 0
                }
            }
            return
        }
        
        for tf in arrayTextFields {
            tf.layer.borderWidth = 0
        }

        let contact = Contact(fistName: contactFirstNameTF.text!,
                middleName: nil, lastName: contactLastNameTF.text!,
                email: contactEmailTF.text!,
                password: contactPasswordTF.text!)
        
        contacts.append(contact)
        let keyCollection = contactFirstNameTF.text!
        contactsDict[keyCollection] = contact

        for tf in arrayTextFields {
            tf.text = ""
        }
        
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
    
    @objc private func didtapHomeWorkButton(){
        let vc = CollectionViewControllePractice()
        vc.dict = contactsDict 
        
        navigationController?.pushViewController(vc, animated: true)
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
        print("DEBUG PRINT: didTap cell: ", indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ContactDetailController()
        vc.firstName.text = "\(contacts[indexPath.row]!.fistName)"
        vc.lastName.text = "\(contacts[indexPath.row]!.lastName)"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
