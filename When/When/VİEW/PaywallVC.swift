//
//  PaywallVC.swift
//  When
//
//  Created by Merve Çalışkan on 22.11.2024.
//

import Foundation
import UIKit
import SnapKit

final class PaywallVC: UIViewController {
    
    private(set) var exampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        exampleLabel.text = "Test Text"
    }
    
    private func setupConstraints() {
        exampleLabel.snp.makeConstraints { make in
//            make.centerX.equalTo()
        }
        
    }
}
