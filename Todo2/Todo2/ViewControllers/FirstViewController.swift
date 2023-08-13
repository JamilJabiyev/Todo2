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
    
    private let getStartedButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(hex: "#50C2C9")
        button.titleLabel?.textColor = UIColor(hex: "#FFFFFF")
        button.layer.cornerRadius = 8
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = Fonts.style(type: .semibold, size: 18)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func buttonTapped() {
        let nextScreen = RegistrationViewController()
            navigationController?.pushViewController(nextScreen, animated: true)
        }
    
    //MARK: - Constraints
    
    private func setupUI(){
                
        let subviewsToAdd = [
            shapeImageView,
            centerImage,
            headerLabel,
            infoLabel,
            getStartedButton
        ]
        
        subviewsToAdd.forEach{ view.addSubview($0)}
        
        shapeImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(0)
        }
        
        centerImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(261)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(centerImage.snp.bottom).offset(65)
            make.leading.equalToSuperview().offset(110)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(16)
            make.leading.equalTo(headerLabel.snp.leading)
            //make.trailing.equalToSuperview().offset(16)
            //make.left.right.equalTo(headerLabel)
            //make.leading.equalTo(headerLabel.snp.leading)
            make.trailing.equalTo(headerLabel.snp.trailing)
            //make.left.equalTo(headerLabel.snp.left)
            //make.right.equalTo(headerLabel.snp.right)
            //make.centerX.equalToSuperview()
            //make.bottom.lessThanOrEqualToSuperview()
        }
        
        getStartedButton.snp.makeConstraints { make in
            //make.top.equalTo(infoLabel.snp.bottom).offset(136)
            make.bottom.equalToSuperview().offset(-73)
            make.centerX.equalToSuperview()
            make.width.equalTo(380)
            make.height.equalTo(60)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}





