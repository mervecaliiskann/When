//
//  SignUpViewController.swift
//  When
//
//  Created by Merve Çalışkan on 10.09.2024.
//

import UIKit

class SignUpVC: UIViewController {
    let header = Header(title: "Hesap Oluşturun")
    let iconButton = IconButton(image: "iconBtn")
    let signUpPage = SignUp(country: "", phoneNumber: "", nameSurname: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

        
    }
    func setupUI() {
        addTarget()
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            header.heightAnchor.constraint(equalToConstant: 50)
        ])
        navigationItem.hidesBackButton = true
        view.addSubview(iconButton)
        let backBarButton = UIBarButtonItem(customView: iconButton)
        navigationItem.leftBarButtonItem = backBarButton
        
        view.addSubview(signUpPage)
        NSLayoutConstraint.activate([
            signUpPage.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 32),
            signUpPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            signUpPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            signUpPage.heightAnchor.constraint(equalToConstant: 350)
        ])

    }
    func addTarget() {
        iconButton.addTarget(self, action: #selector(iconButtonTarget), for: .touchUpInside)
    }
    @objc func iconButtonTarget() {
        navigationController?.popViewController(animated: true)
    }

}
