//
//  MenuCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/11/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import ChameleonFramework

class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        //iv.image = UIImage(named: "top")?.withRenderingMode(.alwaysTemplate)
        
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? .white : UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.0)
            
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? .white : UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.0)
            
        }
    }

    override func setUpView() {
        super.setUpView()
        
        
        addSubview(imageView)
        addContraintsWithFormat(format: "H:[v0(25)]", views: imageView)
        addContraintsWithFormat(format: "V:[v0(25)]", views: imageView)
        //backgroundColor = .white
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
    }

}
