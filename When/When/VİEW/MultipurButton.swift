//
//  MultipurButton.swift
//  When
//
//  Created by Merve Çalışkan on 9.09.2024.
//

import Foundation
import UIKit
final class MultipurButton: UIButton {
    init(title: String, hasbackGround: UIColor?) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        if let bgColor = hasbackGround {
            self.backgroundColor = bgColor
        }  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
          return CGSize(width: 0, height: 56)
      }
}
