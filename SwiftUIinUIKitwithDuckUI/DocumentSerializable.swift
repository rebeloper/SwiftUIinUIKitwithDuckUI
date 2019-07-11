//
//  DocumentSerializable.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 11/07/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import Foundation

protocol DocumentSerializable {
    init?(documentData: [String: Any])
}
