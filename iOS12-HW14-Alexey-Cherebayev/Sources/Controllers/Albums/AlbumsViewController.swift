//
//  AlbumsViewController.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 17.02.2024.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    private var photos: [Photo] = [Photo]()
    private var medias: [Media] = [Media]()
    private var utilities: [Utilities] = [Utilities]()
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    private lazy var albumScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.addSubviews([
            collectionView
        ])
        return scroll
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createPhotoAlbumLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collectionView.register(MediaTypesCell.self, forCellWithReuseIdentifier: MediaTypesCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        collectionView.register(UtilitiesCell.self, forCellWithReuseIdentifier: UtilitiesCell.identifier)
        collectionView.dataSource = self
        albumScrollView.isScrollEnabled = true
        albumScrollView.isUserInteractionEnabled = true
        albumScrollView.contentInsetAdjustmentBehavior = .automatic
        photos = Photo.getPhoto()
        medias = Media.getMedia()
        utilities = Utilities.getUtilities()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.leftBarButtonItem = addButton
    }
    
    private func setupHierarchy() {
        view.addSubview(albumScrollView)
    }
    
    private func setupLayout() {
        albumScrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(view)
            make.edges.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(albumScrollView.snp.width)
            make.height.equalTo(1000)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    // MARK: - Actions
    
    @objc func addButtonTapped() {
        print("DropDown menu")
    }

}

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return photos.count
        case 1:
            return medias.count
        case 2:
            return utilities.count
        default:
            return 10
        }
       
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else {
                        fatalError("Unable to dequeue PhotoCell")
                    }
            
            let photo = photos[indexPath.row]
            cell.configure(with: photo)
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypesCell.identifier, for: indexPath) as? MediaTypesCell else {
                        fatalError("Unable to dequeue SharedCell")
                    }
            
            let media = medias[indexPath.row]
            cell.configure(whith: media)
           
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UtilitiesCell.identifier, for: indexPath) as? UtilitiesCell else {
                        fatalError("Unable to dequeue SharedCell")
                    }
            
            let utilitie = utilities[indexPath.row]
            cell.configure(whith: utilitie)
           
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            guard kind == UICollectionView.elementKindSectionHeader else {
                fatalError("Unexpected supplementary view kind")
            }
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
            headerView.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 30)
            let label = UILabel(frame: CGRect(x: 10, y: 0, width: headerView.frame.width, height: 30))
            label.text = "My albums"
            label.textColor = UIColor.black
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            
            let seeAllLabel = UILabel(frame: CGRect(x: headerView.bounds.width / 1.2, y: 0, width: headerView.frame.width, height: 30))
            seeAllLabel.text = "See All"
            seeAllLabel.textColor = .systemBlue
            
            headerView.addSubview(label)
            headerView.addSubview(seeAllLabel)
            
            return headerView
        case 1:
            guard kind == UICollectionView.elementKindSectionHeader else {
                fatalError("Unexpected supplementary view kind")
            }
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
            headerView.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 30)
            let label = UILabel(frame: CGRect(x: 10, y: collectionView.frame.height / 2 - 325, width: headerView.frame.width, height: 30))
            label.text = "Media Types"
            label.textColor = UIColor.black
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            headerView.addSubview(label)
            
            return headerView
        case 2:
            guard kind == UICollectionView.elementKindSectionHeader else {
                fatalError("Unexpected supplementary view kind")
            }
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
            headerView.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 30)
            let label = UILabel(frame: CGRect(x: 10, y: collectionView.frame.height / 2 - 305, width: headerView.frame.width, height: 30))
            label.text = "Utilities"
            label.textColor = UIColor.black
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            headerView.addSubview(label)
            
            return headerView
        default:
            break
        }
        
        return UICollectionReusableView()
    }
}

