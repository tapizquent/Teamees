//
//  MainVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/10/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    let cellId = "cellId"
    
    //Menu bar constant
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.mainVC = self
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpEventsCollectionView()
        setUpMenuBar()
        setUpNavigationBarIcons()
        
    }
    
    func setUpNavigationBar(){
        navigationItem.title = "Top"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleNavLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleNavLabel.text = "Top"
        titleNavLabel.textColor = .white
        titleNavLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        navigationItem.titleView = titleNavLabel
        
    }
    
    func setUpEventsCollectionView(){
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
            flowlayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor(red:0.02, green:0.02, blue:0.02, alpha:1.0)
        //collectionView?.register(EventCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(HorizontalSectionCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 50, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 50, 0)
        
        collectionView?.isPagingEnabled = true
        
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
        let addImage = UIImage(named: "add_circle")?.withRenderingMode(.alwaysOriginal)
        
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        let accountBarButtonItem = UIBarButtonItem(image: accountImage, style: .plain, target: self, action: #selector(handleProfile))
        let addBarButtonItem = UIBarButtonItem(image: addImage, style: .plain, target: self, action: #selector(handleAddEvent))
        
        navigationItem.rightBarButtonItems = [accountBarButtonItem, searchBarButtonItem]
        navigationItem.leftBarButtonItem = addBarButtonItem
    }
    
    //Scroll horizontally effects and functionallity
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarViewLeftAnchorContraint?.constant = scrollView.contentOffset.x/4
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .init(rawValue: 0), animated: true)
        setNavBarTitles(index: Int(menuIndex))
    }
    
    func setNavBarTitles(index: Int){
        let titles = ["Top", "Local", "Liked", "Recommended"]
        if let titleLabel = navigationItem.titleView as? UILabel{
            titleLabel.text = titles[index]
            
        }
    }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init(rawValue: 0))
        
        setNavBarTitles(index: Int(index))
    }
    
    func handleSearch(){
        print("Search button pressed")
    }
    
    func handleProfile(){
        print("Profile icon pressed")
    }
    func handleAddEvent(){
        print("Add event pressed")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        collectionView.showsHorizontalScrollIndicator = false
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    


}

