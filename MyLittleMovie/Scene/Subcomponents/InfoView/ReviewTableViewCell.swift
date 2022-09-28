//
//  ReviewTableViewCell.swift
//  MyLittleMovie
//
//  Created by zoa0945 on 2022/09/28.
//

import Foundation
import SnapKit

class ReviewTableViewCell: UITableViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.text = "name"
        
        return label
    }()
    
    private let starLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.text = "star"
        
        return label
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.numberOfLines = 3
        label.text = "review"
        
        return label
    }()
    
    func setup() {
        layout()
    }
}

extension ReviewTableViewCell {
    private func layout() {
        [
            nameLabel,
            starLabel,
            reviewLabel
        ].forEach {
            contentView.addSubview($0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
        }
        
        starLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
