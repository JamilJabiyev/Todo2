//
//  FirstViewController.swift
//  ToDo2
//
//  Created by Jamil Jabiyev on 12.08.23.
//

import Foundation
import UIKit
import SnapKit


class FirstViewController: UIViewController {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    //MARK: - Views
    
    private let shapeImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "shape-2")
        imageView.image = image
        return imageView
    }()
    
    private let centerImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "undraw_done_checking_re_6vyx 1")
        imageView.image = image
        return imageView
    }()
    
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Gets things with TODs"
        label.font = Fonts.style(type: .bold, size: 18)
        return label
    }()
    
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet consectetəur. Eget sit nec et euismod. Consequat urna quam felis interdum quisque. Malesuada adipiscing tristique ut eget sed."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Fonts.style(type: .regular, size: 13)
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(hex: "#50C2C9")
        button.titleLabel?.textColor = UIColor(hex: "#FFFFFF")
        button.layer.cornerRadius = 8
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = Fonts.style(type: .semibold, size: 18)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    
    @objc
    private func buttonTapped() {
        let nextScreen = RegistrationViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    //MARK: - Constraints
    
    private func setupUI(){
        
        [
        centerImage,
        headerLabel,
        infoLabel
        ].forEach(stackView.addArrangedSubview)

        stackView.setCustomSpacing(64, after: centerImage)
        
        [
            shapeImageView,
            stackView,
            getStartedButton
        ].forEach(view.addSubview)
        
        shapeImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        // MARK: - REFACTOR
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        getStartedButton.snp.makeConstraints { make in
            //make.top.equalTo(infoLabel.snp.bottom).offset(136)
            make.bottom.equalToSuperview().offset(-64)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
    }
}





