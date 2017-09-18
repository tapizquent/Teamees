//
//  TopCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/12/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class TopCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var events: [Event]?
    
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
        addContraintsWithFormat(format: "H:|-10-[v0]-10-|", views: collectionView)
        addContraintsWithFormat(format: "V:|-10-[v0]|", views: collectionView)
        
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: cellId)
        //backgroundColor = .brown
        fetchEvents()
    }
    
    func fetchEvents(){
        self.events = [Event]()
        let event = Event()
        event.title = "Local Event"
        event.description = "This is where the description will be"
        event.likes = 44
        events?.append(event)
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
