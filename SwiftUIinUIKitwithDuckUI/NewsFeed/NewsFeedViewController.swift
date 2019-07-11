//
//  NewsFeedViewController.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 11/07/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import DuckUI
import ReactiveKit
import Bond
import Layoutless

class NewsFeedViewController: D_ListHFController<NewsFeedCell, Post, NewsFeedHeader, Profile, NewsFeedFooter, Details> {
    
    // MARK:- Dependencies
    
    // MARK:- Properties
    
    // MARK:- Navigation Items
    
    // MARK:- Views
    
    let usersTitleLabel = UILabel().font(.boldSystemFont(ofSize: 18)).text("Users")
    
    let usersViewController = UsersViewController(scrollDirection: .horizontal)
    lazy var usersView = usersViewController.view!.setHeight(100)
    
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
        title = "NewsFeed"
    }
    
    // MARK:- View Did Load Setup
    
    fileprivate func viewDidLoadSetup() {
        
        self.addTopView(height: 150)
        setupTopView()
        self.view.addHomeIndicatorCover(backgroundColor: .purple)
        
        self.addBackground(image: #imageLiteral(resourceName: "DummyImage"))
        
        items = [
            // provide items for the collection view to load
            Post(uid: "0"),
            Post(uid: "1"),
            Post(uid: "2"),
            Post(uid: "3"),
            Post(uid: "0"),
            Post(uid: "1"),
            Post(uid: "2"),
            Post(uid: "3"),
            Post(uid: "0"),
            Post(uid: "1"),
            Post(uid: "2"),
            Post(uid: "3"),
            Post(uid: "0"),
            Post(uid: "1"),
            Post(uid: "2"),
            Post(uid: "3"),
            Post(uid: "0"),
            Post(uid: "1"),
            Post(uid: "2"),
            Post(uid: "3"),
            Post(uid: "0"),
            Post(uid: "1"),
            Post(uid: "2")
        ]
        
        headerItem = [
            // provide only one element that the header will load
            Profile(uid: "01")
        ]
        
        footerItem = [
            // provide only one element that the footer will load
            Details(uid: "23")
        ]
    }
    
    // MARK:- Setup Views
    override func setupViews() {
        super.setupViews()
    }
    
    // MARK:- setupTopView
    fileprivate func setupTopView() {
        stack(.vertical)(
            usersTitleLabel.insetting(by: 10),
            usersView,
            Spacer()
        ).fillingParent().layout(in: topView)
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
    
    override func setupCell(_ cell: NewsFeedCell) {
        super.setupCell(cell)
        // set up your cell with custom behavior
        cell.delegate = self
    }
    
    override func setupHeader(_ header: NewsFeedHeader) {
        super.setupHeader(header)
        // set up your header with custom behavior
        header.delegate = self
    }
    
    override func setupFooter(_ footer: NewsFeedFooter) {
        super.setupFooter(footer)
        // set up your footer with custom behavior
        footer.delegate = self
    }
    
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 100, left: 50, bottom: 0, right: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 100 - 20) / 3
        return .init(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        log.ln("Did tap row: \(indexPath.row)")/
    }
}

extension NewsFeedViewController: NewsFeedCellDelegate {
    open func didTapButton(_ tag: Int, cell: D_ListCell<Post>) {
        guard let item = cell.item else { return }
        log.ln("Did tap button with tag: \(tag) in cell with item: \(item)")/
        (header as! NewsFeedHeader).label.text = "Did tap button with tag: \(tag)"
//        (footer as! NewsFeedFooter).label.text = "Did tap button with tag: \(tag)"
    }
}

extension NewsFeedViewController: NewsFeedHeaderDelegate {
    func didTapButtonn(_ tag: Int, item: Profile) {
        log.ln("Did tap button with tag: \(tag) in header with item: \(item)")/
    }
}

extension NewsFeedViewController: NewsFeedFooterDelegate {
    func didTapButton(_ tag: Int, item: Details) {
        log.ln("Did tap button with tag: \(tag) in footer with item: \(item)")/
    }
}
