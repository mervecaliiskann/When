//
//  OnboardingController.swift
//  When
//
//  Created by Merve Çalışkan on 2.09.2024.
//

import UIKit

class OnboardingVC: UIViewController, UIScrollViewDelegate {
    //MARK: - UI ELEMENTS
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let onboardingButton = MultipurButton(title: "Sonraki", hasbackGround: .multiClr)
    private let atlaButton = MultipurButton(title: "Atla", hasbackGround: .clear)
    private var onboardingViews: [Onboarding] = [
        Onboarding(onboardingImage: UIImage(named: "Onboarding"), onboardingSubTitle: "Hayalinizdeki oteli kısa sürede bulun, tatilin tadını çıkarın."),
        Onboarding(onboardingImage: UIImage(named: "Onboarding2"), onboardingSubTitle: "Haritalarda dolaşın, en iyi konumu bulun ve yeni yerler keşfedin."),
        Onboarding(onboardingImage: UIImage(named: "Onboarding3"), onboardingSubTitle: "Sizin için en iyi oteli seçin ve keyifli bir yolculuk için plan yapın.")
    ]
    private var tanitimBarButton: UIBarButtonItem?
//    let tanitimBarButton = UIBarButtonItem(
//        title: "Tanıtımı Atla",
//        style: .plain,
//        target: OnboardingVC.self,
//        action: #selector(tanitimButtonTarget)
//    )

    
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        tanitimBarButton = UIBarButtonItem(
               title: "Tanıtımı Atla",
               style: .plain,
               target: self, // Doğru: Örneğin kendisini hedef alıyor
               action: #selector(tanitimButtonTarget)
           )
           tanitimBarButton?.tintColor = .multiClr
           navigationItem.rightBarButtonItem = tanitimBarButton
//        tanitimBarButton.tintColor = .multiClr
        
//        navigationItem.rightBarButtonItem = tanitimBarButton
//        navigationItem.rightBarButtonItem?.action = #selector(tanitimButtonTarget)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    //MARK: - FUNC SETUP
    private func setupUI() {
        setupScrollView()
        setupPageControl()
        for (index, onboardingView) in onboardingViews.enumerated() {
            scrollView.addSubview(onboardingView)
            onboardingView.layer.cornerRadius = 16
            
            onboardingView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                onboardingView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                onboardingView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                onboardingView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                onboardingView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(index) * view.frame.width),
                
            ])
            
        }
        
        view.addSubview(onboardingButton)
        onboardingButton.addTarget(self, action: #selector(onboardingButtonTarget), for: .touchUpInside)
        onboardingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onboardingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            onboardingButton.heightAnchor.constraint(equalToConstant: 56),
            onboardingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            onboardingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        
   
        
        view.addSubview(atlaButton)
        atlaButton.setTitleColor(.multiClr, for: .normal)
        atlaButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        atlaButton.addTarget(self, action: #selector(atlaButtonTarget), for: .touchUpInside)
        NSLayoutConstraint.activate([
            atlaButton.topAnchor.constraint(equalTo: onboardingButton.bottomAnchor, constant: 7),
            atlaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180),
            atlaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -180),
            atlaButton.heightAnchor.constraint(equalToConstant: 24),
            atlaButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        
    }
    
    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.layer.cornerRadius = 16
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.contentSize.height)
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = onboardingViews.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor(named: "multiClr")
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.backgroundStyle = .minimal
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalToConstant: 100),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            
            
        ])
    }
    
    //MARK: - ScrollView Delegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        if currentIndex == 0 {
            atlaButton.isHidden = true
            navigationItem.rightBarButtonItem = tanitimBarButton
        }else if currentIndex == 2 {
            atlaButton.isHidden = false
        }else{
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    @objc func tanitimButtonTarget() {
        let pageLast = onboardingViews.count-1
        pageControl.currentPage = pageLast
        let x = CGFloat(pageLast) * view.bounds.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        currentIndex = pageLast
        onboardingButton.setTitle("Giriş Yap", for: .normal)
        
    }
    @objc func atlaButtonTarget() {
        let signVc = SignUpVC()
        self.navigationController?.pushViewController(signVc, animated: true)
    }
    
    
    @objc private func onboardingButtonTarget() {
        if currentIndex < onboardingViews.count - 1 {
            currentIndex += 1
            print(currentIndex)
            let xOffset = CGFloat(currentIndex) * scrollView.frame.width
            scrollView.setContentOffset(CGPoint(x: xOffset, y: scrollView.contentOffset.y), animated: true)
            pageControl.currentPage = currentIndex
            
            if currentIndex == onboardingViews.count - 1 {
                onboardingButton.setTitle("Giriş Yap", for: .normal)
                print(currentIndex)
            }
        } else {
            let signVc = SignUpVC()
            print("signin declared")
            self.navigationController?.pushViewController(signVc, animated: true)
            print("navigated")
        }
    }
}
