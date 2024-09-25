//
//  SignUp.swift
//  When
//
//  Created by Merve Çalışkan on 20.09.2024.
//

import Foundation
import UIKit

final class SignUp: UIView, UIPickerViewDelegate, UIPickerViewDataSource  {
    let selectedCountryIcon = UIImageView()
    let countryButton = UIButton()
    let phoneNumberTextField = UITextField()
    let nameSurnameTextField = UITextField()
    let checkboxButton = UIButton(type: .custom)
    let unCheckboxButton = UIButton(type: .custom)
    
    let countryCodes = [("🇺🇸", "+1"), ("🇹🇷", "+90"), ("🇬🇧", "+44")]
    var selectedCountry: (String, String)?
    let countryPicker = UIPickerView()
   
    
    init(country: String, phoneNumber: String, nameSurname: String) {
        super.init(frame: .zero)
        configure(country: country, phoneNumber: phoneNumber, nameSurname: nameSurname)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(country: String, phoneNumber: String, nameSurname: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        countryButton.translatesAutoresizingMaskIntoConstraints = false
        selectedCountryIcon.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        nameSurnameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(countryButton)
        countryButton.isEnabled = true
        countryButton.isUserInteractionEnabled = true
        countryButton.backgroundColor = .numberClr
        countryButton.setTitle(country, for: .normal)
        countryButton.setTitleColor(.black, for: .normal)
        countryButton.layer.cornerRadius = 8
        countryButton.addTarget(self, action: #selector(showCountryPicker), for: .touchUpInside)
        
        addSubview(phoneNumberTextField)
        phoneNumberTextField.backgroundColor = .numberClr
        phoneNumberTextField.placeholder = "Cep Telefonu"
        phoneNumberTextField.layer.cornerRadius = 8
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 60))
        phoneNumberTextField.leftView = paddingView1
        phoneNumberTextField.leftViewMode = .always
        phoneNumberTextField.text = phoneNumber
        phoneNumberTextField.font = UIFont(name: "Rubik", size: 16)
        phoneNumberTextField.keyboardAppearance = .default
        phoneNumberTextField.keyboardType = .numberPad
        
        NSLayoutConstraint.activate([
            countryButton.topAnchor.constraint(equalTo: self.topAnchor),
            countryButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            countryButton.heightAnchor.constraint(equalToConstant: 56),
            countryButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.27),
            phoneNumberTextField.topAnchor.constraint(equalTo: self.topAnchor),
            phoneNumberTextField.leftAnchor.constraint(equalTo: countryButton.rightAnchor, constant: 16),
            phoneNumberTextField.rightAnchor.constraint(equalTo: self.rightAnchor),
//            phoneNumberTextField.widthAnchor.constraint(equalToConstant: 256),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 56),
        ])
        
        addSubview(nameSurnameTextField)
        nameSurnameTextField.placeholder = "Adınız ve Soyadınız"
        nameSurnameTextField.text = nameSurname
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 60))
        nameSurnameTextField.leftView = paddingView2
        nameSurnameTextField.leftViewMode = .always
        nameSurnameTextField.layer.cornerRadius = 8
        nameSurnameTextField.backgroundColor = .numberClr
        nameSurnameTextField.font = UIFont(name: "Rubik", size: 16)
        nameSurnameTextField.keyboardAppearance = .default
        
        NSLayoutConstraint.activate([
            nameSurnameTextField.topAnchor.constraint(equalTo: countryButton.bottomAnchor, constant: 16),
            nameSurnameTextField.leftAnchor.constraint(equalTo: self.leftAnchor),
            nameSurnameTextField.rightAnchor.constraint(equalTo: self.rightAnchor),
            nameSurnameTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
//        addSubview(checkboxButton)
//        checkboxButton.setImage(UIImage(systemName: "square"), for: .normal)
//        checkboxButton.addTarget(self, action: #selector(checkboxButton), for: .touchUpInside) // -> Protocol çalışman lazım.
//        NSLayoutConstraint.activate([
//            checkboxButton.topAnchor.constraint(equalTo: nameSurnameTextField.bottomAnchor, constant: 24),
//            checkboxButton.leftAnchor.constraint(equalTo: self.leftAnchor),
//            checkboxButton.heightAnchor.constraint(equalToConstant: 20)
//        ])
//        addSubview(unCheckboxButton)
//        unCheckboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
//        NSLayoutConstraint.activate([
//            unCheckboxButton.topAnchor.constraint(equalTo: nameSurnameTextField.bottomAnchor, constant: 24),
//            unCheckboxButton.leftAnchor.constraint(equalTo: self.leftAnchor),
//            unCheckboxButton.heightAnchor.constraint(equalToConstant: 20)
//        ])
        countryPicker.delegate = self
        countryPicker.dataSource = self
    }
   
 
        @objc func showCountryPicker() {
            let alert = UIAlertController(title: "Select Country", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)
            
            
            alert.view.addSubview(countryPicker)
            countryPicker.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                countryPicker.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
                countryPicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 40),
                countryPicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor),
                countryPicker.heightAnchor.constraint(equalToConstant: 160)
            ])
            
            
            let doneButton = UIAlertAction(title: "Done", style: .default) { _ in
                if let selectedCountry = self.selectedCountry {
                    self.countryButton.setTitle("\(selectedCountry.0) \(selectedCountry.1)", for: .normal)
                }
            }
            alert.addAction(doneButton)
            
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelButton)
            
            
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return countryCodes.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            let country = countryCodes[row]
            return "\(country.0) \(country.1)"
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let selectedCountry = countryCodes[row]
            self.selectedCountry = selectedCountry
        }
    }

