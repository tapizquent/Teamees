//
//  EventCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/10/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camp")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.15
        
        return imageView
    }()
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camp")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Camping in South Carolina"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(18)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "We are meeting up all to go to the campground on South Carolina"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        label.alpha = 0.7
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.1, green:0.1, blue:0.1, alpha:0.3)
        return view
    }()
    
    func setUpView() {
        
        addSubview(backgroundImageView)
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        
        //Contraints for background image
        addContraintsWithFormat(format: "H:|[v0]|", views: backgroundImageView)
        addContraintsWithFormat(format: "V:|[v0]|", views: backgroundImageView)
        
        //Contraints for ImageView of Event
        addContraintsWithFormat(format: "H:|-10-[v0(80)]-10-[v1]-10-|", views: thumbnailImageView, titleLabel)
        addContraintsWithFormat(format: "V:|-10-[v0(80)]", views: thumbnailImageView)
        
        //Contraints for Separator Line between cells
        addContraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        addContraintsWithFormat(format: "V:[v0(1)]|", views: separatorView)
        
        //Height for Title Label
        addContraintsWithFormat(format: "V:|-10-[v0(25)]", views: titleLabel)
        
        //contraints for description label
        addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .left, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 10))
        
        addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        
        addContraintsWithFormat(format: "V:[v0(45)]", views: descriptionLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
