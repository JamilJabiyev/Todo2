//
//  UITableViewCell.swift
//  Todo2
//
//  Created by Jamil Jabiyev on 14.08.23.
//

import Foundation
import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    // MARK: - Refactor
    private let logoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Rectangle 9"), for: .normal)
        button.setImage(UIImage(named: "Rectangle 9-2"), for: .selected)
        button.addTarget(self, action: #selector(logoButtonTapped), for: .touchUpInside)

        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func configure(title: String, isSelected: Bool) {
        titleLabel.text = title
    }
    
    @objc
    private func logoButtonTapped(sender: UIButton) {
        sender.isSelected.toggle() // Переключаем состояние кнопки (выбрано/не выбрано)
    }
    
    private func setupUI(){
        contentView.addSubview(logoButton)
        contentView.addSubview(titleLabel)
        
        logoButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.size.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoButton.snp.trailing).offset(8)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}

