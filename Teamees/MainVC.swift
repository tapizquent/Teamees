//
//  MainVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/10/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
        navigationItem.title = "Events"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleNavLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: view.frame.height))
        titleNavLabel.text = "Events"
        titleNavLabel.textColor = .white
        titleNavLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        navigationItem.titleView = titleNavLabel
    }
    
    func setUpEventsCollectionView(){
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
            flowlayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor(red:0.02, green:0.02, blue:0.02, alpha:1.0)
        //collectionView?.register(EventCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
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
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init(rawValue: 0))
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
        let colors: [UIColor] = [.blue, .green, .purple, . gray]
        
        cell.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return events.count
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! EventCell
//        
//        cell.event = events[indexPath.item]
//        cell.backgroundColor = .clear
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: view.frame.width, height: 100)
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }


}

