//
//  RootViewController.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 18/06/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import DuckUI

class RootViewController: D_ViewController {
    
    // MARK:- View
    let simpleView = UIView().debug()
    let helloDuckUILabel = UILabel().text("DuckUI")
        .textAlignment(.center)
    let helloDuckUILabel2 = UILabel().text("DuckUI2")
        .textAlignment(.center)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupViewsWith(safeArea: D_ViewSafeArea) {
        super.setupViewsWith(safeArea: .all)
        container.D_VStack(
            Divider().vertical(.extraLarge).debug(),
            helloDuckUILabel.setPad(.allMargins, amount: 12).debug(),
            Spacer(),
            spacing: 0).pad(.horizontalMargins, amount: 32)
    }
    
    override func observe() {
        super.observe()
    }
    
    override func bond() {
        super.bond()
    }
    
    override func fetchData() {
        super.fetchData()
    }

}

