//
//  MainVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/10/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //Menu bar constant
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Events"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleNavLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: view.frame.height))
        titleNavLabel.text = "Events"
        titleNavLabel.textColor = .white
        titleNavLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        navigationItem.titleView = titleNavLabel
        
        
        collectionView?.backgroundColor = UIColor(red:0.02, green:0.02, blue:0.02, alpha:1.0)
        collectionView?.register(EventCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 50, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 50, 0)
        
        
        setUpMenuBar()
        setUpNavigationBarIcons()
        
    }
    
    // Function setting up the menu bar
    private func setUpMenuBar(){
        view.addSubview(menuBar)
        view.addContraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addContraintsWithFormat(format: "V:[v0(50)]|", views: menuBar)
        
    }
    
    func setUpNavigationBarIcons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let accountImage = UIImage(named: "account_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        let accountBarButtonItem = UIBarButtonItem(image: accountImage, style: .plain, target: self, action: #selector(handleProfile))
        
        navigationItem.rightBarButtonItems = [accountBarButtonItem, searchBarButtonItem]
    }
    
    func handleSearch(){
        print("Search button pressed")
    }
    
    func handleProfile(){
        print("Profile icon pressed")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


}

