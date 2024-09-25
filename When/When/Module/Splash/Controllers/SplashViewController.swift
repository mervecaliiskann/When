//
//  ViewController.swift
//  When
//
//  Created by Merve Çalışkan on 26.08.2024.
//

import UIKit

class SplashViewController: UIViewController {
    let whenLabel = UILabel()
    let whenImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .splash
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(whenImage)
        whenImage.image = UIImage(named: "splashImage")
        whenImage.contentMode = .scaleAspectFit
        whenImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whenImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 414),
            whenImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),
            whenImage.widthAnchor.constraint(equalToConstant: 104),
            whenImage.heightAnchor.constraint(equalToConstant: 104)
        ])
        
        view.addSubview(whenLabel)
        whenLabel.alpha = 0
        whenLabel.text = "When"
        whenLabel.font = UIFont(name: "Rubik", size: 48)
        whenLabel.font = UIFont.boldSystemFont(ofSize: 48)
        whenLabel.textColor = .white
        whenLabel.textAlignment = .center
        whenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whenLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 430),
            whenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 155),
            whenLabel.heightAnchor.constraint(equalToConstant: 72),
            whenLabel.widthAnchor.constraint(equalToConstant: 128)
        ])
        
        performAnimations()
    }
    
    func performAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            UIView.animate(withDuration: 1.0, animations: {
                self.whenImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5).translatedBy(x: -140, y: 0)
            }, completion: { _ in
                UIView.animate(withDuration: 2.0, animations: {
                    self.whenLabel.alpha = 1
                }, completion: { _ in
                    let onboardingVC = OnboardingVC()
                    onboardingVC.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(onboardingVC, animated: true) 
                })
            })
        }
    }
}
