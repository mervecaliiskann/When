//
//  CustomOnboarding.swift
//  When
//
//  Created by Merve Çalışkan on 2.09.2024.
//

import UIKit

final class Onboarding: UIView {
    //MARK: - UIComponents
    private let onboardingImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .top
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
 
    private let onboardingSubTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik", size: 21)
        label.textColor = UIColor(red: 0.204, green: 0.251, blue: 0.329, alpha: 1)
        label.textAlignment = .center

        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    init(onboardingImage: UIImage?, onboardingSubTitle: String) {
        super.init(frame: .zero)
        self.onboardingSubTitle.text = onboardingSubTitle
        self.onboardingImage.image = onboardingImage
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI Setup
    private func setupUI() {
        
        onboardingImage.layer.masksToBounds = true
        addSubview(onboardingImage)
        onboardingImage.layer.cornerRadius = 16
        NSLayoutConstraint.activate([
            onboardingImage.topAnchor.constraint(equalTo: self.topAnchor),
            onboardingImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            onboardingImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            onboardingImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
            onboardingImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        addSubview(onboardingSubTitle)
        NSLayoutConstraint.activate([
            onboardingSubTitle.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor, constant: 16),
            onboardingSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            onboardingSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            onboardingSubTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }
}
