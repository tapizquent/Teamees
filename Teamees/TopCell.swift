//
//  TopCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/12/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import ChameleonFramework

class TopCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var events: [Event]?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = MAIN_BACKGROUND_COLOR
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
        fetchEvents()
        
    }
    
    func fetchEvents(){
        self.events = [Event]()
        let event = Event()
        event.title = "Local Event"
        event.description = "This is where the description will be"
        event.thumbnailImageName = "camp"
        event.likes = 44
        events?.append(event)
        let event2 = Event()
        event2.title = "Soccer Whatever Event"
        event2.description = "This is where the description will be"
        event2.thumbnailImageName = "ocean"
        event2.likes = 55
        events?.append(event2)
        let event3 = Event()
        event3.title = "Ocean Event"
        event3.description = "This is where the description will be"
        event3.thumbnailImageName = "soccer"
        event3.likes = 55
        events?.append(event3)
        let event4 = Event()
        event4.title = "Different Post in Liked Section"
        event4.description = "This is where the liked description will be"
        event4.thumbnailImageName = "red_roses"
        event4.likes = 33
        events?.append(event4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventCell
        
        cell.event = events?[indexPath.item]
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
