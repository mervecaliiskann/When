//
//  VerificationVC.swift
//  When
//
//  Created by Merve Çalışkan on 12.11.2024.
//

import UIKit

final class VerificationVC: UIViewController {
    
    private let header = Header(title: "Tek Kullanımlık Şifre")
    private let iconButton = IconButton(image: "iconBtn")
    private let verifyLabel = UILabel()
    private let verifyTfOne = TextField(placeholder: "", text: "")
    private let verifyTfTwo = TextField(placeholder: "", text: "")
    private let verifyTfThree = TextField(placeholder: "", text: "")
    private let verifyTfFour = TextField(placeholder: "", text: "")
    private let verifyTfFive = TextField(placeholder: "", text: "")
    private let verifyTfSix = TextField(placeholder: "", text: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

 
    }
    private func setupUI() {
        view.addSubview(header)
        view.addSubview(iconButton)
        view.addSubview(verifyLabel)
        
        navigationItem.hidesBackButton = true
        let backBarButton = UIBarButtonItem(customView: iconButton)
        navigationItem.leftBarButtonItem = backBarButton
        
        verifyLabel.text = "+90394579398 numaralı telefona kod göndeerildi."
        verifyLabel.font = UIFont(name: "Rubik", size: 16)
        verifyLabel.textColor = .placeholderText
        verifyLabel.numberOfLines = 0
        verifyLabel.translatesAutoresizingMaskIntoConstraints = false
        verifyLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            header.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            verifyLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 24),
            verifyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            verifyTfOne.topAnchor.constraint(equalTo: verifyLabel.bottomAnchor, constant: 40),
            verifyTfOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            verifyTfOne.widthAnchor.constraint(equalToConstant: 55),
            verifyTfOne.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
}
