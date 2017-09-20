//
//  EventCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/10/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import ChameleonFramework

class EventCell: BaseCell {
    
    var event: Event? {
        didSet {
            titleLabel.text = event?.title
            
            if let thumnailImage = event?.thumbnailImageName {
                thumbnailImageView.image = UIImage(named: thumnailImage)
                backgroundImageView.backgroundColor = UIColor(averageColorFrom: thumbnailImageView.image, withAlpha:0.5)
                //separatorView.backgroundColor = UIColor(averageColorFrom: thumbnailImageView.image).flatten()
            }
            
            descriptionLabel.text = event?.description
            likesLabel.text = "\(event?.likes ?? 0)"
        }
        
    }
    
    
    let gradientBackgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    let backgroundImageView: UIView = {
        let view = UIView()
        //imageView.image = UIImage(named: "camp")
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        imageView.alpha = 0.3
        view.clipsToBounds = true
        
        return view
    }()
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "camp")
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
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
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
    
    let likeButtonImage: UIButton = {
        let lb = UIButton()
        let toLike = UIImage(named: "like_icon")
        lb.setImage(toLike?.withRenderingMode(.alwaysTemplate), for: .normal)
        lb.tintColor = .white
        return lb
    }()
    
    let likesLabel: UILabel = {
        let ll = UILabel()
        ll.text = "125"
        ll.textColor = .white
        ll.font = ll.font.withSize(10)
        ll.textAlignment = .center
        return ll
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.flatBlackColorDark()
        view.alpha = 0.8
        return view
    }()
    
    override func setUpView() {
        
        addSubview(backgroundImageView)
        addSubview(gradientBackgroundView)
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(likeButtonImage)
        addSubview(likesLabel)
        
        likeButtonImage.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        
        //Contraints for background image
        addContraintsWithFormat(format: "H:|[v0]|", views: backgroundImageView)
        addContraintsWithFormat(format: "V:|[v0]|", views: backgroundImageView)
        addContraintsWithFormat(format: "H:|[v0]|", views: gradientBackgroundView)
        addContraintsWithFormat(format: "V:|[v0]|", views: gradientBackgroundView)
        
        gradientBackgroundView.backgroundColor = UIColor(gradientStyle: UIGradientStyle.leftToRight, withFrame: self.frame, andColors: [MAIN_BACKGROUND_COLOR, UIColor.clear])
        
        
        //Contraints for ImageView of Event
        addContraintsWithFormat(format: "H:|-16-[v0(80)]-4-[v1]-16-|", views: thumbnailImageView, titleLabel)
        addContraintsWithFormat(format: "V:|-10-[v0(80)]", views: thumbnailImageView)
        
        //Contraints for Separator Line between cells
        addContraintsWithFormat(format: "H:[v0]|", views: separatorView)
        addConstraint(NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal, toItem: thumbnailImageView, attribute: .left, multiplier: 1, constant: 8))
        addContraintsWithFormat(format: "V:[v0(1)]|", views: separatorView)
        
        //Height for Title Label
        addContraintsWithFormat(format: "V:|-10-[v0(25)]", views: titleLabel)
        
        //contraints for description label
        addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .left, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 10))
        
        addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .right, relatedBy: .equal, toItem: likeButtonImage, attribute: .left, multiplier: 1, constant: 0))
        
        
        addContraintsWithFormat(format: "V:[v0(45)]", views: descriptionLabel)
        
        //Like button constraints
        addConstraint(NSLayoutConstraint(item: likeButtonImage, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: likeButtonImage, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        
        addContraintsWithFormat(format: "V:[v0(30)]", views: likeButtonImage)
        addContraintsWithFormat(format: "H:[v0(30)]", views: likeButtonImage)
        
        addConstraint(NSLayoutConstraint(item: likesLabel, attribute: .top, relatedBy: .equal, toItem: likeButtonImage, attribute: .bottom, multiplier: 1, constant: 0))
        
        addContraintsWithFormat(format: "V:[v0(15)]", views: likesLabel)
        addConstraint(NSLayoutConstraint(item: likesLabel, attribute: .left, relatedBy: .equal, toItem: likeButtonImage, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: likesLabel, attribute: .right, relatedBy: .equal, toItem: likeButtonImage, attribute: .right, multiplier: 1, constant: 0))
        
    }
    
    
    @objc func likeButtonTapped(_ button: UIButton){
        
        let toLike = UIImage(named: "like_icon")
        let liked = UIImage(named: "liked_icon")
        var likes = Int(likesLabel.text!)
        
        if button.isSelected == true {
            button.isSelected = false
            UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                button.setImage(toLike, for: .normal)
            }, completion: nil)
            
            if likes != 0 {
                event?.likes -= 1
                likes? -= 1
                likesLabel.text = "\(likes ?? 0)"
            }
            print("Event Unliked")
        } else {
            button.isSelected = true
            UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromRight, animations: {
                button.setImage(liked, for: .normal)
            }, completion: nil)
            //button.setImage(liked, for: .normal)
            event?.likes += 1
            likes? += 1
            likesLabel.text = "\(likes ?? 0)"
            
            print("Event liked")
            
        }
        
    }
    
}
