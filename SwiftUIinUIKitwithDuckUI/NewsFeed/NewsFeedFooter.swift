//
//  NewsFeedFooter.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 11/07/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import DuckUI
import ReactiveKit
import Bond
import Layoutless

protocol NewsFeedFooterDelegate {
    func didTapButton(_ tag: Int, item: Details)
}

class NewsFeedFooter: D_ListFooter<Details> {
    
    // MARK:- Delegate
    var delegate: NewsFeedFooterDelegate?
    
    // MARK:- Item
    override var item: Details! {
        didSet {
            // configure view with data
            label.text("uid: \(item.uid)")
        }
    }
    
    // MARK:- Views
    lazy var button0 = UIButton().text("Tap me").tag(0)
    lazy var button1 = UIButton().text("Tap me again").tag(1)
    lazy var label = UILabel().textAlignment(.center)
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK:- Setup Views
    override func setupViews() {
        super.setupViews()
        // configure view layout
        backgroundColor = .purple
        
        Layoutless.stack(.vertical)(
            button0,
            button1,
            label,
            Spacer()
            ).fillingParent().layout(in: self)
        
    }
    
    // MARK:- Observe
    override func observe() {
        super.observe()
        button0.reactive.tap.observeNext { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.didTapButton(strongSelf.button0.tag, item: strongSelf.item)
            }.dispose(in: bag)
        
        button1.reactive.tap.observeNext { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.didTapButton(strongSelf.button1.tag, item: strongSelf.item)
            }.dispose(in: bag)
    }
    
    // MARK:- Bind
    override func bind() {
        super.bind()
    }
    
    // MARK:- Fetch Data Manually
    override func fetchData() {
        super.fetchData()
        // discouraged!!!
    }
    
}
