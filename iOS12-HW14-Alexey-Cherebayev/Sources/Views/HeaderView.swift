//
//  HeaderView.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 28.02.2024.
//

import UIKit
import SnapKit

class HeaderView: UICollectionReusableView {
    
    static let identifier = "HeaderView"
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
