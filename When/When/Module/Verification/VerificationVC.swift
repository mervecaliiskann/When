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
    private let verifyTextLabel = UILabel()
    private let verifyNumberLabel = UILabel()
    private let verifyTfOne = TextField(placeholder: "", text: "")
    private let verifyTfTwo = TextField(placeholder: "", text: "")
    private let verifyTfThree = TextField(placeholder: "", text: "")
    private let verifyTfFour = TextField(placeholder: "", text: "")
    private let verifyTfFive = TextField(placeholder: "", text: "")
    private let verifyTfSix = TextField(placeholder: "", text: "")
    private let timeLabel = UILabel()
    private let loginButton = MultipurButton(title: "Gönder", hasbackGround: .multiClrLight)
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

        
        [verifyTfOne, verifyTfTwo, verifyTfThree, verifyTfFour, verifyTfFive, verifyTfSix].forEach { textField in
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
        loginButton.isEnabled = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        
    }
    private func setupUI() {
        view.addSubview(header)
        view.addSubview(iconButton)
        view.addSubview(verifyTextLabel)
        view.addSubview(verifyNumberLabel)
        view.addSubview(verifyTfOne)
        view.addSubview(verifyTfTwo)
        view.addSubview(verifyTfThree)
        view.addSubview(verifyTfFour)
        view.addSubview(verifyTfFive)
        view.addSubview(verifyTfSix)
        view.addSubview(timeLabel)
        view.addSubview(loginButton)
        
        loginButton.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        
        navigationItem.hidesBackButton = true
        let backBarButton = UIBarButtonItem(customView: iconButton)
        navigationItem.leftBarButtonItem = backBarButton
        
        verifyTextLabel.text = "numaralı telefona kod gönderildi."
        verifyTextLabel.font = UIFont(name: "Rubik", size: 16)
        verifyTextLabel.textColor = .placeholderText
        verifyTextLabel.numberOfLines = 0
        verifyTextLabel.translatesAutoresizingMaskIntoConstraints = false
        verifyTextLabel.textAlignment = .center
        
        verifyNumberLabel.text = "+90549 422 29 54"
        verifyNumberLabel.font = UIFont(name: "Rubik", size: 16)
        verifyNumberLabel.textColor = .multiClr
        verifyNumberLabel.numberOfLines = 0
        verifyNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        verifyTextLabel.textAlignment = .left
        
        timeLabel.text = "02.56"
        timeLabel.textColor = .placeholderText
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont(name: "Rubik", size: 16)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: loginButton.topAnchor, constant: 16),
            activityIndicator.leftAnchor.constraint(equalTo: loginButton.leftAnchor, constant: 120),
            activityIndicator.rightAnchor.constraint(equalTo: loginButton.rightAnchor, constant: -120)
        
        
        ])
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            header.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            verifyNumberLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 24),
            verifyNumberLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            verifyTextLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 24),
            verifyTextLabel.leftAnchor.constraint(equalTo: verifyNumberLabel.rightAnchor, constant: 1),
            verifyTextLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        
        NSLayoutConstraint.activate([
            verifyTfOne.topAnchor.constraint(equalTo: verifyTextLabel.bottomAnchor, constant: 40),
            verifyTfOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 26),
            verifyTfOne.widthAnchor.constraint(equalToConstant: 50),
            verifyTfOne.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            verifyTfTwo.topAnchor.constraint(equalTo: verifyTextLabel.bottomAnchor, constant: 40),
            verifyTfTwo.leftAnchor.constraint(equalTo: verifyTfOne.rightAnchor, constant: 8),
            verifyTfTwo.widthAnchor.constraint(equalToConstant: 50),
            verifyTfTwo.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            verifyTfThree.topAnchor.constraint(equalTo: verifyTextLabel.bottomAnchor, constant: 40),
            verifyTfThree.leftAnchor.constraint(equalTo: verifyTfTwo.rightAnchor, constant: 8),
            verifyTfThree.widthAnchor.constraint(equalToConstant: 50),
            verifyTfThree.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            verifyTfFour.topAnchor.constraint(equalTo: verifyTextLabel.bottomAnchor, constant: 40),
            verifyTfFour.leftAnchor.constraint(equalTo: verifyTfThree.rightAnchor, constant: 8),
            verifyTfFour.widthAnchor.constraint(equalToConstant: 50),
            verifyTfFour.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            verifyTfFive.topAnchor.constraint(equalTo: verifyTextLabel.bottomAnchor, constant: 40),
            verifyTfFive.leftAnchor.constraint(equalTo: verifyTfFour.rightAnchor, constant: 8),
            verifyTfFive.widthAnchor.constraint(equalToConstant: 50),
            verifyTfFive.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            verifyTfSix.topAnchor.constraint(equalTo: verifyTextLabel.bottomAnchor, constant: 40),
            verifyTfSix.leftAnchor.constraint(equalTo: verifyTfFive.rightAnchor, constant: 8),
            //            verifyTfSix.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            verifyTfSix.widthAnchor.constraint(equalToConstant: 50),
            verifyTfSix.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: verifyTfThree.bottomAnchor, constant: 24),
            timeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120),
            timeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -120)
        ])
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 48),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
            
        ])
        
    }
    private func areAllTextFieldsFilled() -> Bool {
        return !verifyTfOne.text!.isEmpty &&
        !verifyTfTwo.text!.isEmpty &&
        !verifyTfThree.text!.isEmpty &&
        !verifyTfFour.text!.isEmpty &&
        !verifyTfFive.text!.isEmpty &&
        !verifyTfSix.text!.isEmpty
    }
    private func navigateToHomeVC() {
        let homeVC = HomeVC()
        homeVC.modalTransitionStyle = .crossDissolve
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
    }
    @objc private func textFieldDidChange() {
        if areAllTextFieldsFilled() {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .multiClr
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .multiClrLight
        }
    }
    @objc private func loginButtonTapped() {
        loginButton.setTitle("", for: .normal)
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            self.activityIndicator.stopAnimating()
            self.navigateToHomeVC()
        }
    }
    
}
