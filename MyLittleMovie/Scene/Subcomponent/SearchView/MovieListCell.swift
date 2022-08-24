//
//  MovieListCell.swift
//  MyLittleMovie
//
//  Created by Mac on 2022/08/24.
//

import UIKit
import SnapKit

class MovieListCell: UICollectionViewCell {
    private let thumbnail: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.text = "title"
        
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.text = "horror, comedy"
        
        return label
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.text = "name"
        
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.text = "00:00:00"
        
        return label
    }()
    
    private let descriptionCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.text = "description count"
        
        return label
    }()
    
    private let starLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.text = "star: 5"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieListCell {
    private func layout() {
        [
            thumbnail,
            genreLabel,
            directorLabel,
            titleLabel,
            timeLabel,
            descriptionCountLabel,
            starLabel
        ].forEach {
            addSubview($0)
        }
        
        thumbnail.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
            $0.width.height.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnail)
            $0.leading.equalTo(thumbnail.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        genreLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        directorLabel.snp.makeConstraints {
            $0.top.equalTo(genreLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(directorLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        descriptionCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(thumbnail)
            $0.leading.equalTo(titleLabel)
        }
        
        starLabel.snp.makeConstraints {
            $0.bottom.equalTo(descriptionCountLabel)
            $0.leading.equalTo(descriptionCountLabel.snp.trailing).offset(8)
        }
    }
}
