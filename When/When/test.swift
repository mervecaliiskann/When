////
////  test.swift
////  When
////
////  Created by Merve Çalışkan on 13.09.2024.
////
//
////
////  OnboardingVC.swift
////  NeonAppsMoonX
////
////  Created by Atilla Çıtırık on 19.08.2024.
////
//
//import UIKit
//import NeonSDK
//import SnapKit
//
//class OnboardingVC: UIViewController  {
//    
//    private let onBoardingViewModel =  OnBoardingViewModel()
//    
//    let scrollView = UIScrollView()
//    var currentPage = 0
//    
//    // Birth Date
//    let datePickerTextField = UITextField()
//    let pickerDate = UIDatePicker()
//    
//    // Birth Time
//    let timePickerTextField = UITextField()
//    let pickerTime = UIDatePicker()
//    
//
//        
//    var pageControl = NeonPageControlV1()
//    
//    let page1 = UIView()
//    let page2 = UIView()
//    let page3 = UIView()
//    
//    var pages = [UIView]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//    
//    final func setupUI(){
//        setupPage1()
//        setupPage2()
//        setupPage3()
//        setupPageControl()
//        setupScrollView()
//        
//        let nextButton = UIButton(type: .system)
//        nextButton.setTitle("Next", for: .normal)
//        nextButton.setTitleColor(.white, for: .normal)
//        nextButton.backgroundColor = UIColor(named: "onBoardingButtonColor")
//        nextButton.layer.cornerRadius = 20
//        nextButton.titleLabel?.font = Font.custom(size: 18, fontWeight: FontManager.FontWeight.Medium)
//        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
//        view.addSubview(nextButton)
//        nextButton.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().offset(-60)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(view.frame.width * 0.8)
//            make.height.equalTo(55)
//        }
//        
//    }
//    
//    func setupPageControl() {
//        pageControl = NeonPageControlV1()
//        view.addSubview(pageControl)
//        view.bringSubviewToFront(pageControl)
//        pageControl.snp.makeConstraints { make in
//            make.bottom.equalTo(view.snp.bottom).offset(-160)
//            make.centerX.equalToSuperview()
//        }
//        
//        pageControl.numberOfPages = 3
//        pageControl.radius = 6
//        pageControl.currentPageTintColor = UIColor(named: "pageViewSelectedTintColor")
//        pageControl.tintColor = UIColor(named: "pageViewTintColor")
//        pageControl.padding = 6
//
////        pageControl.tintColors = [UIColor.green, UIColor.yellow, UIColor.blue]
//    }
//    
//    func setupScrollView() {
//        view.addSubview(scrollView)
//        
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.alwaysBounceHorizontal = false
//        scrollView.isPagingEnabled = true
//        
//        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height:view.frame.height)
//        
//        for i in 0..<pages.count {
//            scrollView.addSubview(pages[i])
//            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
//        }
//        scrollView.delegate = self
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        
//        scrollView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//    }
//    
//    final func setupPage1() {
//
//        let backgroundImageView = UIImageView()
//        page1.addSubview(backgroundImageView)
//        backgroundImageView.image = UIImage(named: "moon-sky-night-background-asset-game-2d-futuristic-generative-ai1")
//        backgroundImageView.alpha = 1
//        backgroundImageView.snp.makeConstraints { make in
//            make.left.right.top.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-200)
//        }
//        
//        let backgroundImageGradientLayer = CAGradientLayer()
//        backgroundImageGradientLayer.frame = view.bounds
//        backgroundImageGradientLayer.colors = [UIColor.clear.withAlphaComponent(0.8).cgColor, UIColor.black.cgColor]
//        backgroundImageGradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
//        backgroundImageGradientLayer.endPoint = CGPoint(x: 0.5, y: 10)
//        backgroundImageView.layer.addSublayer(backgroundImageGradientLayer)
//        
//        let welcomeLbl = UILabel()
//        page1.addSubview(welcomeLbl)
//        welcomeLbl.text = "Welcome"
//        welcomeLbl.textColor = UIColor(named: "onBoardingTitleColor1")
//        welcomeLbl.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
////            make.top.equalToSuperview().offset(50)
//            make.centerY.equalToSuperview().offset(view.frame.height * 0.12)
//        }
//        
//        let descriptionLbl = UILabel()
//        page1.addSubview(descriptionLbl)
//        descriptionLbl.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusam. Sed ut perspt perspiciatis unde omnis iste natus error si."
//        descriptionLbl.textColor = UIColor(named: "onBoardingTitleColor2")
//        descriptionLbl.font = Font.custom(size: 16, fontWeight: .Medium)
//        descriptionLbl.numberOfLines = 0
//        descriptionLbl.textAlignment = .center
//        descriptionLbl.snp.makeConstraints { make in
//            make.top.equalTo(welcomeLbl.snp.bottom).offset(24)
//            make.left.right.equalToSuperview().inset(32)
//        }
//        
//        pages.append(page1)
//    }
//    
//    final func setupPage2(){
//
//        let backgroundImageView = UIImageView()
//        page2.addSubview(backgroundImageView)
//        
//        backgroundImageView.image = UIImage(named: "8251828_22311")
//        backgroundImageView.alpha = 0.5
//        backgroundImageView.snp.makeConstraints { make in
//            make.left.right.top.equalToSuperview()
//            make.height.equalTo(view.frame.height / 2)
//        }
//        
//        let descriptionLbl = UILabel()
//        page2.addSubview(descriptionLbl)
//        descriptionLbl.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusam.   Sed ut perspt perspiciatis unde omnis iste natus error si."
//        descriptionLbl.textColor = UIColor(named: "onBoardingTitleColor2")
//        descriptionLbl.font = Font.custom(size: 16, fontWeight: .Medium)
//        descriptionLbl.numberOfLines = 0
//        descriptionLbl.textAlignment = .center
//        descriptionLbl.snp.makeConstraints { make in
//            make.centerY.equalToSuperview().offset(view.frame.height * -0.05)
//            make.left.right.equalToSuperview().inset(32)
//        }
//        
//        // Date View
//        let birthDateView = UIView()
//        page2.addSubview(birthDateView)
//        birthDateView.snp.makeConstraints { make in
//            make.top.equalTo(descriptionLbl.snp.bottom).offset(24)
//            make.left.right.equalToSuperview().inset(24)
//            make.height.equalTo(80)
//        }
//        
//        let birthDateLbl = UILabel()
//        birthDateView.addSubview(birthDateLbl)
//        birthDateLbl.text = "Enter Birth Date"
//        birthDateLbl.textColor = UIColor(named: "onBoardingTitleColor1")
//        birthDateLbl.font = Font.custom(size: 16, fontWeight: FontManager.FontWeight.Medium)
//        birthDateLbl.snp.makeConstraints { make in
//            make.left.right.top.equalToSuperview()
//            make.height.equalTo(20)
//        }
//        
//        // datePickerTextField  -----------****Start****-----------
//        birthDateView.addSubview(datePickerTextField)
//        datePickerTextField.delegate = self
//        datePickerTextField.placeholder = "Select Date"
//        datePickerTextField.textAlignment = .center
//        datePickerTextField.borderStyle = .roundedRect
//        datePickerTextField.backgroundColor = UIColor(named: "pickerBackgroundColor1")
//        datePickerTextField.textColor = UIColor(named: "onBoardingTitleColor2")
//        datePickerTextField.layer.cornerRadius = 16
//        datePickerTextField.snp.makeConstraints { make in
//            make.left.bottom.right.equalToSuperview()
//            make.top.equalTo(birthDateLbl.snp.bottom).offset(8)
//        }
//        
//        // pickerDate
//        pickerDate.datePickerMode = .date
//        pickerDate.maximumDate = Date()
//        pickerDate.preferredDatePickerStyle = .wheels
////        pickerDate.addTarget(self, action: #selector(dateChange), for: .valueChanged)
//
//        let birthDateToolbar = UIToolbar()
//        birthDateToolbar.sizeToFit()
//        
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(birthDateDnePressed))
//        birthDateToolbar.setItems([doneButton], animated: true)
//
//        datePickerTextField.inputView = pickerDate
//        datePickerTextField.inputAccessoryView = birthDateToolbar
//        // datePickerTextField  -----------****End*****-----------
//        
//        // Time View
//        let birthTimeView = UIView()
//        page2.addSubview(birthTimeView)
//        birthTimeView.snp.makeConstraints { make in
//            make.top.equalTo(birthDateView.snp.bottom).offset(12)
//            make.left.right.equalToSuperview().inset(24)
//            make.height.equalTo(80)
//        }
//        
//        let birthTimeLbl = UILabel()
//        birthTimeView.addSubview(birthTimeLbl)
//        birthTimeLbl.text = "Enter Birth Time"
//        birthTimeLbl.textColor = UIColor(named: "onBoardingTitleColor1")
//        birthTimeLbl.font = Font.custom(size: 16, fontWeight: FontManager.FontWeight.Medium)
//        birthTimeLbl.snp.makeConstraints { make in
//            make.left.right.top.equalToSuperview()
//            make.height.equalTo(20)
//
//        }
//
//        // timePickerTextField  -----------****Start****-----------
//        birthTimeView.addSubview(timePickerTextField)
//        timePickerTextField.delegate = self
//        timePickerTextField.placeholder = "Select Time"
//        timePickerTextField.textAlignment = .center
//        timePickerTextField.borderStyle = .roundedRect
//        timePickerTextField.backgroundColor = UIColor(named: "pickerBackgroundColor1")
//        timePickerTextField.textColor = UIColor(named: "onBoardingTitleColor2")
//        timePickerTextField.layer.cornerRadius = 16
//        timePickerTextField.snp.makeConstraints { make in
//            make.left.right.bottom.equalToSuperview()
//            make.top.equalTo(birthTimeLbl.snp.bottom).offset(8)
//        }
//        
//        // pickerTime
//        pickerTime.datePickerMode = .time
//        pickerTime.preferredDatePickerStyle = .wheels
//
//        let birthTimeToolbar = UIToolbar()
//        birthTimeToolbar.sizeToFit()
//        
//        let birthTimeDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(birthTimeDonePressed))
//        birthTimeToolbar.setItems([birthTimeDoneButton], animated: true)
//
//        timePickerTextField.inputView = pickerTime
//        timePickerTextField.inputAccessoryView = birthTimeToolbar
//        // timePickerTextField  -----------****End*****-----------
// 
//        pages.append(page2)
//    }
//    
//    final func setupPage3(){
//
//        let backgroundImageView = UIImageView()
//        page3.addSubview(backgroundImageView)
//        
//        backgroundImageView.image = UIImage(named: "8251828_22312")
//        backgroundImageView.alpha = 0.5
//        backgroundImageView.snp.makeConstraints { make in
//            make.left.right.top.equalToSuperview()
//            make.height.equalTo(view.frame.height / 2)
//        }
//        
//        let titleLbl = UILabel()
//        page3.addSubview(titleLbl)
//        titleLbl.text = "Lorem Ipsum"
//        titleLbl.textAlignment = .center
//        titleLbl.font = Font.custom(size: 22, fontWeight: FontManager.FontWeight.Medium)
//        titleLbl.textColor = UIColor(named: "onBoardingTitleColor1")
//        
//        titleLbl.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(view.frame.height * -0.08)
//            make.left.right.equalToSuperview()
//        }
//        
//        let descriptionLbl = UILabel()
//        page3.addSubview(descriptionLbl)
//        descriptionLbl.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusam.   Sed ut perspt perspiciatis unde omnis iste natus error si."
//        descriptionLbl.textColor = UIColor(named: "onBoardingTitleColor2")
//        descriptionLbl.font = Font.custom(size: 16, fontWeight: .Medium)
//        descriptionLbl.numberOfLines = 0
//        descriptionLbl.textAlignment = .center
//        descriptionLbl.snp.makeConstraints { make in
//            make.top.equalTo(titleLbl.snp.bottom).offset(24)
//            make.left.right.equalToSuperview().inset(32)
//        }
//        
//        let placeView = UIView()
//        page3.addSubview(placeView)
//        placeView.snp.makeConstraints { make in
//            make.top.equalTo(descriptionLbl.snp.bottom).offset(72)
//            make.left.right.equalToSuperview().inset(20)
//        }
//        
//        let titlePicker = UILabel()
//        placeView.addSubview(titlePicker)
//        titlePicker.textColor = UIColor(named: "onBoardingTitleColor1")
//        titlePicker.text = "Enter your Place of Birth"
//        titlePicker.font = Font.custom(size: 16, fontWeight: FontManager.FontWeight.Regular)
//        titlePicker.snp.makeConstraints { make in
//            make.top.left.right.equalToSuperview()
//        }
//        
//        let pickerView = UIPickerView()
//        placeView.addSubview(pickerView)
//        pickerView.delegate = self
//        pickerView.dataSource = self
//        pickerView.backgroundColor = UIColor(named: "pickerBackgroundColor1")
//        pickerView.layer.cornerRadius = 16
//        pickerView.snp.makeConstraints { make in
//            make.top.equalTo(titlePicker.snp.bottom).offset(12)
//            make.left.right.bottom.equalToSuperview()
//            make.height.equalTo(48)
//        }
// 
//        pages.append(page3)
//        
//    }
//    
//    @objc func birthDateDnePressed() {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        
//        datePickerTextField.text = formatter.string(from: pickerDate.date)
//        UserDefaults.standard.set(datePickerTextField.text, forKey: "userBirthDate")
//        view.endEditing(true)
//    }
//    
//    @objc func birthTimeDonePressed() {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        formatter.dateFormat = "HH:mm"
//        timePickerTextField.text = formatter.string(from: pickerTime.date)
//        UserDefaults.standard.set(timePickerTextField.text, forKey: "userBirthTime")
//        view.endEditing(true)
//    }
//    
//    @objc func nextPage(){
//
//        if currentPage < pages.count - 1 {
//            currentPage += 1
//            let newOffset = CGPoint(x: scrollView.frame.width * CGFloat(currentPage), y: 0)
//            scrollView.setContentOffset(newOffset, animated: true)
//        } else {
//            let vc = HomeVC()
//            present(destinationVC: vc, slideDirection: .down)
//        }
//
//    }
//
//}
//
//extension OnboardingVC: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        scrollView.contentOffset.y = 0
//        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
//        pageControl.set(progress: Int(pageIndex), animated: true)
//    }
//}
