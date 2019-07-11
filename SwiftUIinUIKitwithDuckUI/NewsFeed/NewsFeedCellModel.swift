//
//  NewsFeedCellModel.swift
//  SwiftUIinUIKitwithDuckUI
//
//  Created by Alex Nagy on 11/07/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import Foundation

struct Post {
    
    var uid: String
    
    var dictionary: [String: Any] {
        return [
            "uid": uid
        ]
    }
    
}

extension Post: DocumentSerializable {
    init?(documentData: [String : Any]) {
        let uid = documentData["uid"] as? String ?? ""
        
        self.init(uid: uid)
    }
}

extension Post: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Post(dictionary: \(dictionary))"
    }
}

extension Post: CustomStringConvertible {
    var description: String {
        return "Post(uid: \(uid))"
    }
}
