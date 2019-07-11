//
//  NewsFeedFooterModel.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 11/07/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import Foundation

struct Details {
    
    var uid: String
    
    var dictionary: [String: Any] {
        return [
            "uid": uid
        ]
    }
    
}

extension Details: DocumentSerializable {
    init?(documentData: [String : Any]) {
        let uid = documentData["uid"] as? String ?? ""
        
        self.init(uid: uid)
    }
}

extension Details: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Details(dictionary: \(dictionary))"
    }
}

extension Details: CustomStringConvertible {
    var description: String {
        return "Details(uid: \(uid))"
    }
}
