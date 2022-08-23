//
//  LatestSearchView.swift
//  MyLittleMovie
//
//  Created by Mac on 2022/08/23.
//

import UIKit
import SnapKit

class LatestSearchView: UIView {
    
    lazy var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    private let spacingView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LatestSearchView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        
        cell.setup()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MovieCell.height, height: MovieCell.height)
    }
}

extension LatestSearchView {
    private func layout() {
        [
            searchCollectionView,
            spacingView
        ].forEach {
            addSubview($0)
        }
        
        searchCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(MovieCell.height)
        }
        
        spacingView.snp.makeConstraints {
            $0.top.equalTo(searchCollectionView.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}
