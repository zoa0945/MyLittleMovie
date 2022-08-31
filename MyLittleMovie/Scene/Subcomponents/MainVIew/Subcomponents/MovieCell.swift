//
//  MovieCell.swift
//  MyLittleMovie
//
//  Created by Mac on 2022/08/23.
//

import UIKit
import SnapKit

class MovieCell: UICollectionViewCell {
    static let height: CGFloat = 150
    
    private let thumbnail: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.layer.cornerRadius = 5
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let starCount: UILabel = {
        let label = UILabel()
        label.text = "평점 : ⭐️"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel

        return label
    }()
    
    func setup() {
        layout()
    }
}

extension MovieCell {
    private func layout() {
        [
            thumbnail,
            titleLabel,
            starCount
        ].forEach {
            addSubview($0)
        }
        
        thumbnail.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnail.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        
        starCount.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.bottom.equalToSuperview()
        }
    }
}
