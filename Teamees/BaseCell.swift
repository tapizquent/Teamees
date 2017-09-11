//
//  BaseCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/11/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView(){
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
