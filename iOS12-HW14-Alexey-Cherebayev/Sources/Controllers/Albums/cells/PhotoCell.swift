//
//  PhotoCell.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 28.02.2024.
//

import UIKit
import SnapKit

class PhotoCell: UICollectionViewCell {
    static let identifier = "PhotoCell"
    
    // MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor.gray
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var imageContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray2.withAlphaComponent(0.5)
        view.layer.cornerRadius = 8
        view.addSubview(imageView)
        return view
    }()
    
    private lazy var albumTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private lazy var albumCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray3
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        imageView.frame = contentView.bounds
    }
    
    private func setupHierarchy() {
        contentView.addSubviews([
            imageContentView,
            albumTitleLabel,
            albumCountLabel
        ])
    }
    
    private func setupLayout() {
        imageContentView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalTo(contentView)
        }
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(imageContentView.snp.centerX)
            make.centerY.equalTo(imageContentView.snp.centerY)
            make.left.right.bottom.top.equalTo(imageContentView)
        }
        albumTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageContentView.snp.bottom).offset(5)
            make.left.right.equalTo(contentView)
        }
        albumCountLabel.snp.makeConstraints { make in
            make.top.equalTo(albumTitleLabel.snp.bottom).offset(1)
        }
    }

    // MARK: - Config
    
    func configure(with model: Photo) {
        if model.count > 0 {
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: model.image)
        } else {
            imageView.contentMode = .center
            imageView.image = UIImage(systemName: "photo.on.rectangle")
        }
        albumTitleLabel.text = model.name
        albumCountLabel.text = "\(model.count)"
    }
}
