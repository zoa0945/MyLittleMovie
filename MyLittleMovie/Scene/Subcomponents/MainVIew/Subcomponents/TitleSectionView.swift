//
//  TitleSectionView.swift
//  MyLittleMovie
//
//  Created by Mac on 2022/08/23.
//

import UIKit
import SnapKit

class TitleSectionView: UIView {
    
    private let todayMovieImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleSectionView {
    private func layout() {
        [
            todayMovieImage
        ].forEach {
            addSubview($0)
        }
        
        todayMovieImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(snp.width)
        }
    }
}
