//
//  ProfileCell.swift
//  MyLittleMovie
//
//  Created by Mac on 2022/09/05.
//

import UIKit
import SnapKit

class ProfileCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.text = "name"
        
        return label
    }()
    
    func setup() {
        layout()
    }
}

extension ProfileCell {
    private func layout() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
}
