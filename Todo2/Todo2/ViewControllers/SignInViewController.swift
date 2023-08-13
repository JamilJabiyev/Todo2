//
//  SignInViewController.swift
//  ToDo2
//
//  Created by Jamil Jabiyev on 13.08.23.
//

import Foundation
import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        tapGesture()
        tapGestureForRegistration()
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
        label.text = "Welcome back"
        label.font = Fonts.style(type: .bold, size: 18)
        
        return label
    }()
    
    private let centerImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "undraw_back_to_school_inwc 1")
        imageView.image = image
        
        return imageView
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
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 80
        
        return stackView
    }()
    
    private let forgetPasswordLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Forget password ?"
        label.font = Fonts.style(type: .regular, size: 13)
        label.textColor = UIColor(hex: "#50C2C9")
        
        return label
    }()
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: nil, message: "Password was sended to your mail", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
            }
    
    private func tapGesture(){
        //Добавляем жест "нажатие" (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showAlert))
        forgetPasswordLabel.addGestureRecognizer(tapGesture)
        forgetPasswordLabel.isUserInteractionEnabled = true
    }
    
    private let loginButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(hex: "#50C2C9")
        button.titleLabel?.textColor = UIColor(hex: "#FFFFFF")
        button.layer.cornerRadius = 8
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = Fonts.style(type: .semibold, size: 18)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func buttonTapped() {
        let nextScreen = ViewController()
            navigationController?.pushViewController(nextScreen, animated: true)
        }
    
    
    
    
    
    private let registrationLabel: UILabel = {
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
    
    private func tapGestureForRegistration(){
        //Добавляем жест "нажатие" (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signInLabelTapped))
        registrationLabel.addGestureRecognizer(tapGesture)
        registrationLabel.isUserInteractionEnabled = true
    }
    
    
    @objc private func signInLabelTapped() {
//        let nextScreen = RegistrationViewController()
//        navigationController?.pushViewController(nextScreen, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    
    
    //MARK: - Constraints
    
    private func setupUI(){
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
        
        let subviewsToAdd = [
            shapeImageView,
            headerLabel,
            centerImage,
            stackView,
            forgetPasswordLabel,
            loginButton,
            registrationLabel
        ]
        
        subviewsToAdd.forEach{ view.addSubview($0)}
        
        shapeImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(0)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(248)
            //make.leading.equalToSuperview().offset(111)
        }
        
        centerImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerLabel.snp.bottom).offset(53)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(centerImage.snp.bottom).offset(87)
            //make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(23)
        }
        
        forgetPasswordLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(90)
        }
        
        loginButton.snp.makeConstraints { make in
            //make.top.equalTo(forgetPasswordLabel.snp.bottom).offset(48)
            make.bottom.equalToSuperview().offset(-73)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(60)
        }
        
        registrationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(19)
        }
        
    }

    
    
    
    
    
    
    
    
    
    
    
}













