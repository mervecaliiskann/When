//
//  signButton.swift
//  When
//
//  Created by Merve Çalışkan on 11.11.2024.
//

import Foundation
import UIKit

final class signButton: UIButton {
   private let signImage = UIImageView()
   private let signTitle = UILabel()
    init(image: String, title: String, hasbackGround: String, titleColor: UIColor?) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 12
        
        configure(image: image, title: title, hasbackGround: UIColor(named: hasbackGround), titleColor: titleColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(image: String, title: String, hasbackGround: UIColor?,titleColor: UIColor? ) {
        addSubview(signImage)
        addSubview(signTitle)
        self.backgroundColor = hasbackGround ?? UIColor.lightGray
        signImage.contentMode = .scaleAspectFit
        signImage.translatesAutoresizingMaskIntoConstraints = false
        signImage.image = UIImage(named: image)
        
        signTitle.text = title
        signTitle.textColor = titleColor
        signTitle.font = UIFont(name: "Poppins-Regular", size: 16)
        signTitle.textAlignment = .left
        signTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            signImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 75),
            signImage.widthAnchor.constraint(equalToConstant: 20),
            signImage.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            signTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            signTitle.leftAnchor.constraint(equalTo: signImage.rightAnchor, constant: 8)
        ])
    }
}
