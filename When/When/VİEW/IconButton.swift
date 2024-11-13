//
//  IconButton.swift
//  When
//
//  Created by Merve Çalışkan on 18.09.2024.
//

import Foundation
import UIKit

final class IconButton: UIButton {
    init(image: String) {
        super.init(frame: .zero)
        self.setImage(UIImage(named: image), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
