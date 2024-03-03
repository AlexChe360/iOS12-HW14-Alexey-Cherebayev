//
//  UtilitiesCell.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 02.03.2024.
//

import UIKit

class UtilitiesCell: UICollectionViewCell {
    
    static let identifier = "UtilitiesCell"
    
    // MARK: - Outlets
    
    private lazy var imageIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray2
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.systemGray2
        imageView.image = UIImage(systemName: "chevron.right")
        return imageView
    }()
    
    
    private lazy var sharedView: UIView = {
        let view = UIView()
        view.addSubviews([
            imageIconView,
            textLabel,
            countLabel,
            arrowImageView
        ])
        return view
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
        sharedView.addBorders(edges: .bottom, color: UIColor.systemGray6)
    }
    
    private func setupHierarchy() {
        contentView.addSubview(sharedView)
    }
    
    private func setupLayout() {
        sharedView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.right.equalTo(contentView).inset(10)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        imageIconView.snp.makeConstraints { make in
            make.left.equalTo(sharedView.snp.left)
            make.centerY.equalTo(textLabel.snp.centerY)
        }
        textLabel.snp.makeConstraints { make in
            make.left.equalTo(imageIconView.snp.right).offset(10)
            make.centerY.equalTo(sharedView.snp.centerY)
        }
        countLabel.snp.makeConstraints { make in
            make.centerY.equalTo(textLabel.snp.centerY)
            make.right.equalTo(arrowImageView.snp.left).inset(-10)
        }
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(textLabel.snp.centerY)
            make.right.equalTo(sharedView.snp.right)
        }
    }

    // MARK: - Configure
    
    func configure(whith model: Utilities) {
        imageIconView.image = UIImage(systemName: model.image)
        textLabel.text = model.name
        countLabel.text = "\(model.count)"
    }
    
}
