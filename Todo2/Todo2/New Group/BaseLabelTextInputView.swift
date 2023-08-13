//
//  BaseLabelTextInputView.swift
//  ToDo2
//
//  Created by Jamil Jabiyev on 13.08.23.
//

import Foundation
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
        view.addSubview(inputTextField)
        
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
        //inputTextField.becomeFirstResponder()
        //inputTextField.delegate
    }
    
    //MARK: - Constraints
    
    func setup(){
        addSubview(wrapperInputFieldView)
        
        wrapperInputFieldView.snp.makeConstraints { make in
            make.width.equalTo(380)
            make.height.equalTo(50)
        }
        
        inputTextField.snp.makeConstraints { make in
            make.left.equalTo(wrapperInputFieldView.snp.left).offset(25)
            make.top.equalTo(wrapperInputFieldView.snp.top).offset(15)
            make.bottom.equalTo(wrapperInputFieldView.snp.bottom).offset(-15)
            make.height.equalTo(20)
        }
    }

    
    
    
    
    
    
}






