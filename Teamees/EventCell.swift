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
                backgroundImageView.backgroundColor = UIColor(averageColorFrom: thumbnailImageView.image, withAlpha:0.8)
                //separatorView.backgroundColor = UIColor(averageColorFrom: thumbnailImageView.image).flatten()
            }
            
            descriptionLabel.text = event?.description
            likesLabel.text = "\(event?.likes ?? 0)"
        }
        
    }
    
    
    let gradientBackgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
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
    
    let likeButton: UIButton = {
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
        view.backgroundColor = UIColor.flatWhiteColorDark()
        view.alpha = 0.1
        return view
    }()
    
    let functionsView: UIView = {
        let view = UIView()
        return view
    }()
    
    let functionSeparatorView: UIView = {
        let view = UIView()
        view.alpha = 0.1
        return view
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        let toBookmark = UIImage(named: "bookmark_outline")
        button.setImage(toBookmark?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let infoButton: UIButton = {
        let button = UIButton()
        let infoImage = UIImage(named: "info")
        button.setImage(infoImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func setUpView() {
        
        addSubview(backgroundImageView)
        addSubview(gradientBackgroundView)
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(functionsView)
        
        functionsView.addSubview(likeButton)
        functionsView.addSubview(bookmarkButton)
        functionsView.addSubview(infoButton)
        functionsView.addSubview(functionSeparatorView)
        functionsView.addSubview(separatorView)
        
        
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        
        //Contraints for background image
        addContraintsWithFormat(format: "H:|[v0]|", views: backgroundImageView)
        addContraintsWithFormat(format: "V:|[v0]|", views: backgroundImageView)
        addContraintsWithFormat(format: "H:|[v0]|", views: gradientBackgroundView)
        addContraintsWithFormat(format: "V:|[v0]|", views: gradientBackgroundView)
        
        gradientBackgroundView.backgroundColor = UIColor(gradientStyle: UIGradientStyle.leftToRight, withFrame: self.frame, andColors: [MAIN_BACKGROUND_COLOR, UIColor.clear])
        
        
        addContraintsWithFormat(format: "H:|[v0]|", views: functionsView)
        addContraintsWithFormat(format: "V:[v0(40)]|", views: functionsView)
        //Contraints for ImageView of Event
        addContraintsWithFormat(format: "H:|-16-[v0(80)]-4-[v1]-16-|", views: thumbnailImageView, titleLabel)
        addContraintsWithFormat(format: "V:|-10-[v0(80)]", views: thumbnailImageView)
        
        //Contraints for Separator Line between cells
       
        
        //Height for Title Label
        addContraintsWithFormat(format: "V:|-10-[v0(25)]", views: titleLabel)
        
        //contraints for description label
        addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .left, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 10))
        
        
        addContraintsWithFormat(format: "V:[v0(45)]", views: descriptionLabel)
        
        functionsView.addContraintsWithFormat(format: "V:|[v0]|", views: likeButton)
        functionsView.addConstraint(NSLayoutConstraint(item: likeButton, attribute: .right, relatedBy: .equal, toItem: bookmarkButton, attribute: .left, multiplier: 1, constant: 0))
        functionsView.addContraintsWithFormat(format: "H:[v0(40)]|", views: bookmarkButton)
        functionsView.addContraintsWithFormat(format: "V:|[v0]|", views: bookmarkButton)
        functionsView.addContraintsWithFormat(format: "V:|[v0]|", views: infoButton)
        functionsView.addContraintsWithFormat(format: "H:|[v0(40)]", views: infoButton)
        
        functionsView.addContraintsWithFormat(format: "H:|[v0]|", views: functionSeparatorView)
        functionsView.addContraintsWithFormat(format: "V:|[v0(1)]", views: functionSeparatorView)
        functionSeparatorView.backgroundColor = UIColor(gradientStyle: UIGradientStyle.leftToRight, withFrame: self.frame, andColors: [UIColor.clear, FlatWhiteDark()])
        functionsView.addContraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
    }
    
    
    @objc func likeButtonTapped(_ button: UIButton){
        
        let toLike = UIImage(named: "like_icon")
        let liked = UIImage(named: "liked_icon")
        
        if button.isSelected == true {
            button.isSelected = false
            UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                button.setImage(toLike, for: .normal)
            }, completion: nil)
            
            if event?.likes != 0 {
                event?.likes -= 1
            }
            print("Event Unliked")
        } else {
            button.isSelected = true
            UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromRight, animations: {
                button.setImage(liked, for: .normal)
            }, completion: nil)
            //button.setImage(liked, for: .normal)
            event?.likes += 1
            print("Event liked")
            
        }
        
    }
    
    @objc func bookmarkButtonTapped(_ button: UIButton){
        let toBookmark = UIImage(named: "bookmark_outline")
        let bookmarked = UIImage(named: "bookmark_filled")
        
        if button.isSelected == true {
            button.isSelected = false
            UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                button.setImage(toBookmark, for: .normal)
            }, completion: nil)
        } else {
            button.isSelected = true
            UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromRight, animations: {
                button.setImage(bookmarked, for: .normal)
            }, completion: nil)
        }
        
    }
    
}
