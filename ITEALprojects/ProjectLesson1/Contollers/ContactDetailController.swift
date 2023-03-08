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
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    var lastName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    ///
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .red
        
        self.view.addSubview(firstName)
        self.view.addSubview(lastName)
        self.view.addSubview(collectionView)
        firstName.translatesAutoresizingMaskIntoConstraints = false
        lastName.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
}

extension ContactDetailController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            firstName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            firstName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 20),
            lastName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            lastName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            

        ])
    }
}

extension ContactDetailController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 300, height: 100)
    }
    
}

extension ContactDetailController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        
        cell.backgroundColor = .red
//        cell.addSubview(firstName)
        
        return cell
    }
}

extension ContactDetailController : UICollectionViewDelegate {}
