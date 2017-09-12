//
//  HorizontalSectionCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/12/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class HorizontalSectionCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var events: [Event] = {
        var campEvent = Event()
        campEvent.title = "Camping out in South Carolina"
        campEvent.thumbnailImageName = "camp"
        campEvent.description = "We are going to go caping in X city, SC. Whoever is interested hmu"
        campEvent.likes = 6
        
        var soccerEvent = Event()
        soccerEvent.title = "Soccer game @ Soccer City"
        soccerEvent.thumbnailImageName = "soccer"
        soccerEvent.description = "Soccer game in Soccer city, we need 25 people. Join up"
        soccerEvent.likes = 129
        
        var campEvent1 = Event()
        campEvent1.title = "Camping out in South Carolina"
        campEvent1.thumbnailImageName = "camp"
        campEvent1.description = "We are going to go caping in X city, SC. Whoever is interested hmu"
        campEvent1.likes = 6
        
        var soccerEvent1 = Event()
        soccerEvent1.title = "Soccer game @ Soccer City"
        soccerEvent1.thumbnailImageName = "soccer"
        soccerEvent1.description = "Soccer game in Soccer city, we need 25 people. Join up"
        soccerEvent1.likes = 129
        
        var campEvent2 = Event()
        campEvent2.title = "Camping out in South Carolina"
        campEvent2.thumbnailImageName = "camp"
        campEvent2.description = "We are going to go caping in X city, SC. Whoever is interested hmu"
        campEvent2.likes = 6
        
        var soccerEvent2 = Event()
        soccerEvent2.title = "Soccer game @ Soccer City"
        soccerEvent2.thumbnailImageName = "soccer"
        soccerEvent2.description = "Soccer game in Soccer city, we need 25 people. Join up"
        soccerEvent2.likes = 129
        
        var campEvent3 = Event()
        campEvent3.title = "Camping out in South Carolina"
        campEvent3.thumbnailImageName = "camp"
        campEvent3.description = "We are going to go caping in X city, SC. Whoever is interested hmu"
        campEvent3.likes = 6
        
        var soccerEvent3 = Event()
        soccerEvent3.title = "Soccer game @ Soccer City"
        soccerEvent3.thumbnailImageName = "soccer"
        soccerEvent3.description = "Soccer game in Soccer city, we need 25 people. Join up"
        soccerEvent3.likes = 129
        
        return [campEvent, soccerEvent, campEvent1, soccerEvent1, campEvent2, soccerEvent2, campEvent3, campEvent3]
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = UIColor(red:0.02, green:0.02, blue:0.02, alpha:1.0)
        return cv
    }()

    let cellId = "cellId"
    
    override func setUpView()
    {
        super.setUpView()
        
        addSubview(collectionView)
        addContraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addContraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: cellId)
        //backgroundColor = .brown
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventCell
        
        cell.event = events[indexPath.item]
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


}
