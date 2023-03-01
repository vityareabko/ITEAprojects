//
//  ViewController.swift
//  ITEALprojects
//
//  Created by Витя Рябко on 01/03/23.
//

import UIKit

class MainController: UIViewController {
    
    // MARK: - UI Components
    private lazy var projectLesson1Button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Project 1 - Contact Table", for: .normal)
        button.titleLabel?.font = .robotoBold18()!
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(projectLesson1Button)
        
        self.view.addSubview(projectLesson1Button)
        projectLesson1Button.translatesAutoresizingMaskIntoConstraints = false
        
            setConstraints()
    }
    
    // MARK: - Selectors
    
    @objc private func didTappedButton(){
        let vc = ProjectContactsController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions

extension MainController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            projectLesson1Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            projectLesson1Button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150),
            projectLesson1Button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.65),
            
        ])
    }
}
