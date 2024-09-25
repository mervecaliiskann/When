//
//  Header.swift
//  When
//
//  Created by Merve Çalışkan on 15.09.2024.
//

import Foundation
import UIKit
final class Header: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        self.font = UIFont(name: "Rubik", size: 20)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.textAlignment = .center
        self.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

