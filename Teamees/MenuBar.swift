//
//  MenuBar.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/11/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        addContraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addContraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
         backgroundColor = UIColor(red:0.02, green:0.02, blue:0.02, alpha:1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
