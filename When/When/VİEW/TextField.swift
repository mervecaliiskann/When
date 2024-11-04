//
//  TextField.swift
//  When
//
//  Created by Merve Çalışkan on 3.10.2024.
//

import Foundation
import UIKit

final class TextField : UITextField {
    
    let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 60))
    
    
    init(placeholder: String, text: String) {
        super.init(frame: .zero)
        self.backgroundColor = .numberClr
        self.layer.cornerRadius = 8
        self.font = UIFont(name: "Rubik", size: 16)
        self.keyboardAppearance = .default
        self.keyboardType = .numberPad
        self.placeholder = placeholder
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftView = paddingView1
        self.leftViewMode = .always
    }
//    let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 60))
//    phoneNumberTextField.leftView = paddingView1
//    phoneNumberTextField.leftViewMode = .always
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
