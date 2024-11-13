//
//  SignUpViewController.swift
//  When
//
//  Created by Merve Çalışkan on 10.09.2024.
//


import UIKit

final class SignUpVC: UIViewController {

    private let header = Header(title: "Hesap Oluşturun")
    private let iconButton = IconButton(image: "iconBtn")
    private let phoneNumberTf = TextField(placeholder: "Cep Telefonu", text: "")
    private let nameSurnameTf = TextField(placeholder: "Adınız ve Soyadınız", text: "")

    private let countryView = UIView()
    private let countryLabel = UILabel()
    private let countryButton = UIButton()
    private let pickerView = UIPickerView()
    private let checkBox = UIImageView()
    private let specialOffersLabel = UILabel()
    private let memberButton = MultipurButton(title: "Üye ol", hasbackGround: .multiClrLight)
    private let googleButton = signButton(image: "google", title: "Google ile devam ediniz", hasbackGround: "numberClr", titleColor: .black)
    private let facebookButton = signButton(image: "Facebook", title: "Facebook ile devam ediniz", hasbackGround: "facebookClr", titleColor: .white)
    private let membershipLabel = UILabel()
    private let loginPromptLabel = UILabel()
    private let veyaImage = UIImageView()
    
    private let countries: [String: String] = [
        "🇹🇷": "+90",   // Türkiye
        "🇺🇸": "+1",    // Amerika Birleşik Devletleri
        "🇬🇧": "+44",   // Birleşik Krallık
        "🇩🇪": "+49",   // Almanya
        "🇫🇷": "+33",   // Fransa
        "🇪🇸": "+34",   // İspanya
        "🇮🇹": "+39",   // İtalya
        "🇯🇵": "+81",   // Japonya
        "🇨🇳": "+86",   // Çin
        "🇮🇳": "+91",   // Hindistan
        "🇨🇦": "+1",    // Kanada
        "🇦🇺": "+61",   // Avustralya
        "🇧🇷": "+55",   // Brezilya
        "🇷🇺": "+7",    // Rusya
        "🇰🇷": "+82",   // Güney Kore
        "🇿🇦": "+27",   // Güney Afrika
        "🇲🇽": "+52",   // Meksika
        "🇦🇪": "+971",  // Birleşik Arap Emirlikleri
        "🇸🇦": "+966",  // Suudi Arabistan
        "🇳🇬": "+234",  // Nijerya
        "🇳🇱": "+31",   // Hollanda
        "🇦🇷": "+54",   // Arjantin
        "🇸🇬": "+65",   // Singapur
        "🇭🇰": "+852",  // Hong Kong
        "🇳🇿": "+64",   // Yeni Zelanda
        "🇹🇭": "+66",   // Tayland
        "🇲🇾": "+60",   // Malezya
        "🇸🇪": "+46",   // İsveç
        "🇳🇴": "+47",   // Norveç
        "🇩🇰": "+45",   // Danimarka
        "🇫🇮": "+358",  // Finlandiya
        "🇮🇩": "+62",   // Endonezya
        "🇵🇭": "+63",   // Filipinler
        "🇵🇰": "+92",   // Pakistan
        "🇪🇬": "+20",   // Mısır
        "🇮🇷": "+98",   // İran
        "🇻🇳": "+84",   // Vietnam
        "🇺🇦": "+380",  // Ukrayna
        "🇵🇱": "+48"    // Polonya
    ]

    private var countryKeys: [String] {
        return Array(countries.keys)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupPickerView()
    }

    private func setupUI() {
        addTarget()
        view.addSubview(header)
        view.addSubview(iconButton)
        view.addSubview(phoneNumberTf)
        view.addSubview(nameSurnameTf)
        view.addSubview(countryView)
        view.addSubview(checkBox)
        view.addSubview(specialOffersLabel)
        view.addSubview(memberButton)
        view.addSubview(membershipLabel)
        view.addSubview(loginPromptLabel)
        view.addSubview(veyaImage)
        view.addSubview(googleButton)
        view.addSubview(facebookButton)
        
        phoneNumberTf.keyboardType = .numberPad
        phoneNumberTf.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        nameSurnameTf.keyboardType = .default

        countryView.addSubview(countryLabel)
        countryView.addSubview(countryButton)
        countryView.translatesAutoresizingMaskIntoConstraints = false
        countryView.backgroundColor = .numberClr
        countryView.layer.cornerRadius = 12

        countryLabel.text = "\(countryKeys[0]) \(countries[countryKeys[0]]!)"
        countryLabel.font = .systemFont(ofSize: 18)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false

        countryButton.setTitle("▼", for: .normal)
        countryButton.setTitleColor(.black, for: .normal)
        countryButton.titleLabel?.font = .systemFont(ofSize: 18)
        countryButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        countryButton.translatesAutoresizingMaskIntoConstraints = false

        navigationItem.hidesBackButton = true
        let backBarButton = UIBarButtonItem(customView: iconButton)
        navigationItem.leftBarButtonItem = backBarButton
        
        checkBox.image = UIImage(named: "Checkbox")
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        checkBox.addGestureRecognizer(tapGesture)
        
        specialOffersLabel.text = "When’in bana özel kampanya, tanıtım ve fırsatlarından haberdar olmak istiyorum."
        specialOffersLabel.font = UIFont(name: "Rubik", size: 12)
        specialOffersLabel.textAlignment = .left
        specialOffersLabel.translatesAutoresizingMaskIntoConstraints = false
        specialOffersLabel.numberOfLines = 0
        specialOffersLabel.textColor = .lightGray
        
        membershipLabel.text = "Üyeliğin var mı?"
        membershipLabel.font = UIFont(name: "Rubik", size: 16)
        membershipLabel.textAlignment = .center
        membershipLabel.translatesAutoresizingMaskIntoConstraints = false
        membershipLabel.textColor = .black
        
        loginPromptLabel.text = "Giriş Yap"
        loginPromptLabel.font = UIFont(name: "Rubik", size: 16)
        loginPromptLabel.textAlignment = .left
        loginPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        loginPromptLabel.textColor = .black
        loginPromptLabel.textColor = .multiClr
        loginPromptLabel.isUserInteractionEnabled = true
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(loginPromptLabelTapped))
        loginPromptLabel.addGestureRecognizer(labelTapGesture)
        
        veyaImage.image = .veya
        veyaImage.contentMode = .scaleAspectFit
        veyaImage.translatesAutoresizingMaskIntoConstraints = false
        
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            specialOffersLabel.topAnchor.constraint(equalTo: nameSurnameTf.bottomAnchor, constant: 8),
            specialOffersLabel.leftAnchor.constraint(equalTo: checkBox.rightAnchor, constant: 12),
            specialOffersLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            checkBox.topAnchor.constraint(equalTo: nameSurnameTf.bottomAnchor, constant: 16),
            checkBox.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            checkBox.heightAnchor.constraint(equalToConstant: 20),
            checkBox.widthAnchor.constraint(equalToConstant: 20)
        
        ])

        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            header.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumberTf.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 32),
            phoneNumberTf.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            phoneNumberTf.widthAnchor.constraint(equalToConstant: 250),
            phoneNumberTf.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            nameSurnameTf.topAnchor.constraint(equalTo: phoneNumberTf.bottomAnchor, constant: 16),
            nameSurnameTf.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nameSurnameTf.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameSurnameTf.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            countryView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 32),
            countryView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            countryView.rightAnchor.constraint(equalTo: phoneNumberTf.leftAnchor, constant: -16),
            countryView.widthAnchor.constraint(equalToConstant: 120),
            countryView.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            countryLabel.centerYAnchor.constraint(equalTo: countryView.centerYAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: countryView.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            countryButton.centerYAnchor.constraint(equalTo: countryView.centerYAnchor),
            countryButton.trailingAnchor.constraint(equalTo: countryView.trailingAnchor, constant: -8),
            countryButton.widthAnchor.constraint(equalToConstant: 24),
            countryButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        NSLayoutConstraint.activate([
            memberButton.topAnchor.constraint(equalTo: specialOffersLabel.bottomAnchor, constant: 40),
            memberButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            memberButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            memberButton.heightAnchor.constraint(equalToConstant: 56)
        
        ])
        NSLayoutConstraint.activate([
            membershipLabel.topAnchor.constraint(equalTo: memberButton.bottomAnchor, constant: 16),
            membershipLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 110)
        ])
        NSLayoutConstraint.activate([
            loginPromptLabel.topAnchor.constraint(equalTo: memberButton.bottomAnchor, constant: 16),
            loginPromptLabel.leftAnchor.constraint(equalTo: membershipLabel.rightAnchor, constant: 2)
        
        ])
        NSLayoutConstraint.activate([
            veyaImage.topAnchor.constraint(equalTo: loginPromptLabel.bottomAnchor, constant: 30),
            veyaImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            veyaImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            veyaImage.heightAnchor.constraint(equalToConstant: 24)
        
        ])
        
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: veyaImage.bottomAnchor, constant: 24),
            googleButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            googleButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            googleButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 16),
            facebookButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            facebookButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            facebookButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setupPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    private func addTarget() {
        iconButton.addTarget(self, action: #selector(iconButtonTarget), for: .touchUpInside)
    }

    @objc private func showPicker() {
        pickerView.isHidden.toggle()
    }

    @objc func iconButtonTarget() {
        navigationController?.popViewController(animated: true)
    }
    @objc private func changeImage() {
        if checkBox.image == UIImage(named: "Checkbox") {
            checkBox.image = UIImage(named: "checkBoxFull")
        } else {
            checkBox.image = UIImage(named: "Checkbox")
        }
    }
    @objc private func loginPromptLabelTapped() {
            let LoginVC = LoginVC() 
            navigationController?.pushViewController(LoginVC, animated: true)
        }
    @objc private func textFieldDidChange() {
        if let text = phoneNumberTf.text, !text.isEmpty {
            memberButton.backgroundColor = .multiClr
        } else {
            memberButton.backgroundColor = .multiClrLight
        }
    }
}

extension SignUpVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryKeys.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let key = countryKeys[row]
        return "\(key) \(countries[key]!)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let key = countryKeys[row]
        countryLabel.text = "\(key) \(countries[key]!)"
        pickerView.isHidden = true
    }
}
