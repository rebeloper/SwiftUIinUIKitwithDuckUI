//
//  Stylesheet.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 30/06/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import DuckUI
import Layoutless

struct Stylesheet {
    struct Label {
        static let name = Style<UILabel> {
            $0.font(.boldSystemFont(ofSize: 23))
            $0.textAlignment(.center)
            $0.setMultiline()
        }
    }
}
