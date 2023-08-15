//
//  BaseLabelTextInputView.swift
//  ToDo2
//
//  Created by Jamil Jabiyev on 13.08.23.
//
import UIKit
import SnapKit


struct BaseLabelTextInputViewModel {
    let placeholder: String
}

class BaseLabelTextInputView: UIView, UITextFieldDelegate {
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Construction textField
    
    lazy var wrapperInputFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = Fonts.style(type: .regular, size: 13)
        textField.becomeFirstResponder()
        //textField.textColor = UIColor(hex: "#000000CC")?.withAlphaComponent(0.8)
        //textField.isEnabled = true
        //textField.isUserInteractionEnabled = true
        
        return textField
    }()
    
    func configure(_ item: BaseLabelTextInputViewModel) {
        inputTextField.placeholder = item.placeholder
        inputTextField.isEnabled = true
        inputTextField.isUserInteractionEnabled = true
        inputTextField.delegate = self
    }
    
    //MARK: - Constraints
    
    func setup(){
        addSubview(wrapperInputFieldView)
        
        wrapperInputFieldView.addSubview(inputTextField)
        
        wrapperInputFieldView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
            make.height.equalTo(50)
        }
        
        inputTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.trailing.equalToSuperview()
            //make.height.equalTo(20)
        }
    }
}






