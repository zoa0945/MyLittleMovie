//
//  FilterView.swift
//  MyLittleMovie
//
//  Created by Mac on 2022/09/06.
//

import UIKit
import SnapKit

class FilterView: UIView {
    private let sortButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterView {
    private func layout() {
        addSubview(sortButton)
        
        sortButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.height.equalTo(20)
        }
    }
}
