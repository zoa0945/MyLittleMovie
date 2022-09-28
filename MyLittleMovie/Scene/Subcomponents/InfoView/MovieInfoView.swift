//
//  MovieInfoView.swift
//  MyLittleMovie
//
//  Created by Mac on 2022/08/27.
//

import UIKit
import SnapKit

class MovieInfoView: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label
        label.text = "title"
        
        return label
    }()
    
    private let thumbnail: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        
        return image
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.text = "director"
        
        return label
    }()
    
    private let actorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.text = "actor"
        
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.text = "genre"
        
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.text = "running time"
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.numberOfLines = 3
        label.text = "description"
        
        return label
    }()
    
    lazy var reviewTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "ReviewTableViewCell")
        
        tableView.rowHeight = 102
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        layout()
    }
}

extension MovieInfoView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as? ReviewTableViewCell else { return UITableViewCell() }
        
        cell.setup()
        
        return cell
    }
}

extension MovieInfoView {
    private func layout() {
        [
            titleLabel,
            thumbnail,
            directorLabel,
            actorLabel,
            genreLabel,
            timeLabel,
            descriptionLabel,
            reviewTableView
        ].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(24)
        }
        
        thumbnail.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.width.height.equalTo(UIScreen.main.bounds.width - 24)
        }
        
        directorLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnail.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        actorLabel.snp.makeConstraints {
            $0.top.equalTo(directorLabel.snp.bottom).offset(6)
            $0.leading.equalTo(directorLabel)
        }
        
        genreLabel.snp.makeConstraints {
            $0.top.equalTo(actorLabel.snp.bottom).offset(6)
            $0.leading.equalTo(directorLabel)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(genreLabel)
            $0.leading.equalTo(genreLabel.snp.trailing).offset(6)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(genreLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        reviewTableView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(6)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
