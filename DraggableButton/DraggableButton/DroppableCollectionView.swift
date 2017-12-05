//
//  DroppableCollectionView.swift
//  DraggableButton
//
//  Created by Adhitya Surya Pratama on 11/8/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit
class DroppableCollectionView : UICollectionView {
    
    override func awakeFromNib() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
    }
}
