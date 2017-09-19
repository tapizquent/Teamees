//
//  MainVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/10/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Hero
import Firebase
import SwiftKeychainWrapper
//import IGListKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //let FIRAuth = FirebaseAuthorizer(
    let userStatusChecker: UserStatusChecker? = FirebaseStatusChecker()
    
    //var hidingNavigationManager: HidingNavigationBarManager?
    let topCellId = "topCellId"
    let localCellId = "localCellId"
    let likedCellId = "likedCellId"
    let recommendedCellId = "recommendedCellId"
    let emptyCellId = "emptyCellId"
    
    //View Controllers
    let signInVC = SignInVC()
    let createAccountVC = CreateAccountVC()
    let profileVC = ProfileVC()
    
    //Animation
    let slideAnimator = SlideAnimator()
    
    //Menu bar constant
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.mainVC = self
        return mb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesNavigationBarHairline = true
        
        
        //let userStatusChecker: UserStatusChecker? = FirebaseStatusChecker()
        //let currentUserUid = userStatusChecker?.getCurrentUserUid()
        //isHeroEnabled = true
        setUpNavigationBar()
        setUpEventsCollectionView()
        setUpMenuBar()
        setUpNavigationBarIcons()
        isHeroEnabled = true
        if userStatusChecker?.isUserAuthenticated() == true {
            print("JOSE: User is signed in")
        } else {
            print("JOSE: No User signed in yet")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //hidingNavigationManager?.viewWillAppear(true)
//        let height: CGFloat = 100 //whatever height you want
//        let bounds = self.navigationController!.navigationBar.bounds
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        self.collectionView?.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        //hidingNavigationManager?.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       // hidingNavigationManager?.viewWillDisappear(true)
        
    }
    
    
    func setUpNavigationBar(){
        navigationController?.navigationBar.isTranslucent = false
        
        
        //navigationController?.hidesBarsOnSwipe = true
        
        let titleNavLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleNavLabel.text = "Top"
        titleNavLabel.textColor = .white
        
        titleNavLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        navigationItem.titleView = titleNavLabel
        
        
        
    }
    
    func setUpEventsCollectionView(){
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
            flowlayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = MAIN_BACKGROUND_COLOR
        
        
        collectionView?.register(TopCell.self, forCellWithReuseIdentifier: topCellId)
        collectionView?.register(LocalCell.self, forCellWithReuseIdentifier: localCellId)
        collectionView?.register(LikedCell.self, forCellWithReuseIdentifier: likedCellId)
        collectionView?.register(RecommendedCell.self, forCellWithReuseIdentifier: recommendedCellId)
        collectionView?.register(EmptyCell.self, forCellWithReuseIdentifier: emptyCellId)
        
        
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 60, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 60, 0)
        
        collectionView?.isPagingEnabled = true
        
    }
    
    
    
    // Function setting up the menu bar
    private func setUpMenuBar(){
        
        
        view.addSubview(menuBar)
        view.addContraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addContraintsWithFormat(format: "V:[v0(60)]|", views: menuBar)

        
        
        
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
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
        
        setNavBarTitles(index: Int(index))
    }
    
    @objc func handleSearch(){
        print("Search button pressed")
    }
    
    @objc func handleProfile(){
        if userStatusChecker?.isUserAuthenticated() == true {
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            navigationController?.pushViewController(signInVC, animated: true)
        }
        
    }
    @objc func handleAddEvent(){
        //var authorizer  = FirebaseAuthorizer()
        //var test = Test(toPrint: "Hello, Jose!", authorizer: authorizer)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.showsHorizontalScrollIndicator = false
        
        switch indexPath.item {
        case 0:
            return dequeueCells(topCellId, indexPath)
        case 1:
            return dequeueCells(localCellId, indexPath)
        case 2:
            if userStatusChecker?.isUserAuthenticated() == true {
                return dequeueCells(likedCellId, indexPath)
            } else {
                return dequeueCells(emptyCellId, indexPath)
            }
        case 3:
            if userStatusChecker?.isUserAuthenticated() == true {
                return dequeueCells(recommendedCellId, indexPath)
            } else {
                return dequeueCells(emptyCellId, indexPath)
            }
        default:
            return dequeueCells(emptyCellId, indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 60)
    }
    
    func dequeueCells(_ reuseIdentifier: String, _ indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell!
    }

}

