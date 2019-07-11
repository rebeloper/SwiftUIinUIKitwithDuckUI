//
//  UsersViewController.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 11/07/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import DuckUI
import ReactiveKit
import Bond
import Layoutless

class UsersViewController: D_ListController<UsersCell, UserProfile> {
    
    // MARK:- Dependencies
    
    // MARK:- Properties
    
    // MARK:- Navigation Items
    
    // MARK:- Views
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        viewDidLoadSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK:- Setup Navigation
    
    fileprivate func setupNavigation() {
        title = "Users"
    }
    
    // MARK:- View Did Load Setup
    
    fileprivate func viewDidLoadSetup() {
        
//        self.addTopView(height: 200)
//        self.view.addHomeIndicatorCover(backgroundColor: .white)
        
        items = [
            // provide items for the collection view to load
            UserProfile(uid: "0"),
            UserProfile(uid: "1"),
            UserProfile(uid: "2"),
            UserProfile(uid: "3"),
            UserProfile(uid: "0"),
            UserProfile(uid: "1"),
            UserProfile(uid: "2"),
            UserProfile(uid: "3")
        ]
    }
    
    // MARK:- Setup Views
    override func setupViews() {
        super.setupViews()
    }
    
    // MARK:- Observe
    override func observe() {
        super.observe()
    }
    
    // MARK:- Bind
    override func bind() {
        super.bind()
    }
    
    // MARK:- Fetch Data Manually
    override func fetchData() {
        super.fetchData()
    }
    
    override func setupCell(_ cell: UsersCell) {
        super.setupCell(cell)
        // set up your cell with custom behavior
        cell.delegate = self
    }
    
}

extension UsersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 100
        return .init(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        log.ln("Did tap row: \(indexPath.row)")/
    }
}

extension UsersViewController: UsersCellDelegate {
    open func didTapButton(_ tag: Int, cell: D_ListCell<UserProfile>) {
        guard let item = cell.item else { return }
        log.ln("Did tap button with tag: \(tag) in cell with item: \(item)")/
    }
}

