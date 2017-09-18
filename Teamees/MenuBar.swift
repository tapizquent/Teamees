//
//  MenuBar.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/11/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let menuCellImages = ["top", "local", "liked_icon", "recommended"]
    
    var mainVC: MainVC?
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red:0.02, green:0.02, blue:0.02, alpha:1.0)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addContraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addContraintsWithFormat(format: "V:|[v0(50)]|", views: collectionView)
        collectionView.isScrollEnabled = false
        
        let selectedItem = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedItem as IndexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        setUpHorizontalBar()
        
    }
    
    var horizontalBarViewLeftAnchorContraint: NSLayoutConstraint?
    
    func setUpHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = .white
        horizontalBarView.alpha = 0.9
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        //Contraints
        horizontalBarViewLeftAnchorContraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarViewLeftAnchorContraint?.isActive = true
        horizontalBarView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        mainVC?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: menuCellImages[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
