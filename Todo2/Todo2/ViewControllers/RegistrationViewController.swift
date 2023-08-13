//
//  RegistrationViewController.swift
//  ToDo2
//
//  Created by Jamil Jabiyev on 13.08.23.
//

import Foundation
import UIKit
import SnapKit

class RegistrationViewController: UIViewController{
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        tapGesture()
    }
    
    //MARK: - Views
    
    private let shapeImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "shape-2")
        imageView.image = image
        
        return imageView
    }()
    
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome to Onboard!"
        label.font = Fonts.style(type: .bold, size: 18)
        
        return label
    }()
    
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Let’s help to meet up your tasks."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Fonts.style(type: .regular, size: 13)
        
        return label
    }()
    
    private let nameField: BaseLabelTextInputView = {
        let textField = BaseLabelTextInputView()
        textField.configure(.init(placeholder: "Enter your full name"))
        //textField.inputTextField.delegate = self
        return textField
    }()
    
    private let emailField: BaseLabelTextInputView = {
        let textField = BaseLabelTextInputView()
        textField.configure(.init(placeholder: "Enter your Email"))
        //textField.inputTextField.delegate = self
        return textField
    }()
    
    private let passwordField: BaseLabelTextInputView = {
        let textField = BaseLabelTextInputView()
        textField.configure(.init(placeholder: "Enter Password"))
        //textField.inputTextField.delegate = self
        return textField
    }()
    
    private let confirmPasswordField: BaseLabelTextInputView = {
        let textField = BaseLabelTextInputView()
        textField.configure(.init(placeholder: "Confirm Password"))
        //textField.inputTextField.delegate = self
        return textField
    }()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 80
        
        return stackView
    }()
    
    private let registerButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(hex: "#50C2C9")
        button.titleLabel?.textColor = UIColor(hex: "#FFFFFF")
        button.layer.cornerRadius = 8
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = Fonts.style(type: .semibold, size: 18)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func buttonTapped() {
        let nextScreen = ViewController()
            navigationController?.pushViewController(nextScreen, animated: true)
        }
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isUserInteractionEnabled = true

        let attributedText = NSMutableAttributedString(string: "Already have an account ? ", attributes: [
            .font: Fonts.style(type: .regular, size: 16)!,
            .foregroundColor: UIColor.black // Цвет для части текста до "Sign In"
        ])

        attributedText.append(NSAttributedString(string: "Sign In", attributes: [
            .font: Fonts.style(type: .regular, size: 16)!,
            .foregroundColor: UIColor(hex: "#50C2C9")! // Цвет для "Sign In"
        ]))
        
        label.attributedText = attributedText
        
            return label
        }()
    
    private func tapGesture(){
        //Добавляем жест "нажатие" (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signInLabelTapped))
        signInLabel.addGestureRecognizer(tapGesture)
        signInLabel.isUserInteractionEnabled = true
    }
    
    
    @objc private func signInLabelTapped() {
        let nextScreen = SignInViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    
    //MARK: - Constraints

    private func setupUI(){
        stackView.addArrangedSubview(nameField)
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
        stackView.addArrangedSubview(confirmPasswordField)
                
        let subviewsToAdd = [
            shapeImageView,
            headerLabel,
            infoLabel,
            stackView,
            registerButton,
            signInLabel
        ]
        
        subviewsToAdd.forEach{ view.addSubview($0)}
        
        shapeImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(0)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(248)
            make.leading.equalToSuperview().offset(111)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(16)
            make.leading.equalTo(headerLabel.snp.leading)
            make.trailing.equalTo(headerLabel.snp.trailing)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(90)
            //make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(23)
        }
        
        registerButton.snp.makeConstraints { make in
            //make.top.equalTo(stackView.snp.bottom).offset(73)
            make.bottom.equalToSuperview().offset(-73)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(60)
        }
        
        signInLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(19)
        }
}







}

