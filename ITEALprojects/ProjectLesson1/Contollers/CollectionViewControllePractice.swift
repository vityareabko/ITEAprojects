//
//  CollectionViewControllePractice.swift
//  MultiSport
//
//  Created by Витя Рябко on 05/03/23.
//

import UIKit

class CollectionViewControllePractice: UIViewController {
    
    // MARK: - Variables
    var dict : [String : Contact] = [:]
    
    // MARK: - UI Components
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
}

extension CollectionViewControllePractice {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension CollectionViewControllePractice : UICollectionViewDelegate{}

extension CollectionViewControllePractice : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 300, height: 100)
    }
}

extension CollectionViewControllePractice : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as? CustomCollectionCell else {
            fatalError("Error in CollectionViewControllePractice ")
        }
        
        let FirstName = dict.keys.first
        
        let array = Array(dict.values)

        cell.firstName.text = array[indexPath.item].fistName
        cell.secondName.text = array[indexPath.item].lastName
       
        cell.backgroundColor = .green
        return cell
    }
}

class CustomCollectionCell : UICollectionViewCell {
    
    static let identifier = "CustomCell"
    
    var firstName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    var secondName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(firstName)
        self.addSubview(secondName)
        firstName.translatesAutoresizingMaskIntoConstraints = false
        secondName.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            firstName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            firstName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            firstName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            
            secondName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 10),
            secondName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            secondName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            
        
        
        ])
    }
}

